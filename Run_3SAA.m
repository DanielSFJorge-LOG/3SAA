function [aphy_3SAA,adg_3SAA,ANW,BBP,KD,RRS]=IOP_OLCI(RRS,ASOL,~,GAMMA,FLAG_CorRaman,idSensor,FLAG_Norm,Flag_bbw,bbw,sss,sst,Flag_aw,aw,KD_user_flag,KD_user)

Rrs=RRS;
asol00=ASOL;

%RRS,ASOL,~,GAMMA,FLAG_CorRaman,idSensor,FLAG_Norm,Flag_bbw,bbw,sss,sst,Flag_aw,aw,KD_user_flag,KD_user
[ANW0b,BBP0b,KD0b]=run_LS2_2022(Rrs,asol00,[],4,1,4,0,0,[],[],[],0,[],0,[]);


%%%pre calculate acdm slope - adapted from Lee et al., 20xx
rrs443=Rrs(:,2)./(0.52+1.7.*Rrs(:,2));
rrs560=Rrs(:,5)./(0.52+1.7.*Rrs(:,5));
S=0.019+(0.002./(0.6+(rrs443./rrs560)));

%OWC from Melin & Vantrepotte 2015
class=OWC(Rrs);

%%%Import aphy*
aphy_spec=coder.load(['LUT\uitz08_surface']);%For Global application
aphy_spec1=coder.load(['LUT\uitz08_surface1annick']);%For Gyres application
wl=[412 444 490 510 560 666];
    for w=1:length(wl)
    p1=wl(w);
    pos1(w)=find(aphy_spec.wv0==p1);
    end       
aphy_ref=aphy_spec.a_spec0(pos1,:);
aphy_ref1=aphy_spec1.a_spec0([2 3 4 5 6 8],:);

%%%run Zhang 2018
wv=[412 443 490 510 NaN NaN]; 
tic
for i=1:length(ANW0b)
        
        if class(i)>=15
        %aphy*,wavelengths,anw, acdmS, OWC
        results=ainv_dual('uitz08_surface1annick',wv,ANW0b(i,:),S(i),class(i));
        adg_tmp=(results.a_nap'.*exp((400-wl).*results.s_nap'));
        aphy_tmp=(aphy_ref1*results.chl)';
        aphy1_tmp=ANW0b(i,:)-adg_tmp;
        adg_3SAA(i,:)=adg_tmp; aphy(i,:)=aphy_tmp;
        slopeinsitu(i)=results.s_nap;
        aphy_3SAA(i,:)=aphy1_tmp; clear adg_tmp aphy_tmp aphy1_tmp aphy1
                
        else
            
        results=ainv_dual('uitz08_surface',wv,ANW0b(i,:),S(i),class(i));
        adg_tmp=(results.a_nap'.*exp((400-wl).*results.s_nap'));
        aphy_tmp=(aphy_ref*results.chl)';
        aphy1_tmp=ANW0b(i,:)-adg_tmp;
        adg_3SAA(i,:)=adg_tmp; aphy(i,:)=aphy_tmp; 
        slopeinsitu(i)=results.s_nap;
        aphy_3SAA(i,:)=aphy_tmp;clear adg_tmp aphy_tmp aphy1_tmp aphy1

        
        end
end
toc
clear results
aphy_3SAA(find(aphy_3SAA<=0))=NaN;
adg_3SAA(find(adg_3SAA<=0))=NaN;


end