%%%/*-----------------------------------------------------------------------------
%%%  Read LUT
%%% -----------------------------------------------------------------------------*/   

function [LO,AW,BBW,lut_bb,lut_a,usedL,lut_Raman,lut_RamanMin,lut_RamanMax]=read_LUT(idCapteur,path_mapping)

idSEAWIFS   = 0 ;
idMODIS     = 1 ; 
idMERIS     = 2 ; 
idOLCI      = 3 ; 
idOLCI6WL   = 4 ; 
% global idSEAWIFS;
% global idMODIS;
% global idMERIS;
% global idOLCI;
% global idOLCI6WL;
global path_mapping;

cd([path_mapping '\LUT'])
     switch idCapteur       
      case idSEAWIFS
        usedL=1:6;
        nomlut=readtable('param_lutsSW.csv');
        nomlut=table2array(nomlut(1:3,1:6));
        nomLutRaman=load('lut_Raman_SeaWiFS.txt');       
        
      case idMODIS
        usedL=1:6;
        nomlut=readtable('param_lutsMODIS.csv');
        nomlut=table2array(nomlut(1:3,1:6));
        nomLutRaman=load('lut_Raman_MODIS.txt');
        
      case idMERIS
        usedL=1:6;
        nomlut=readtable('param_lutsMeris.csv');
        nomlut=table2array(nomlut(1:3,1:6));
        nomLutRaman=load('lut_Raman_Meris.txt');
        
      case idOLCI
        usedL(1)=2; usedL(2)=3; usedL(3)=4; usedL(4)=5; usedL(5)=6; usedL(6)=8;
        nomlut=readtable('param_lutsOLCI.csv');
        nomlut=table2array(nomlut(1:3,1:8));
        nomLutRaman=load('lut_Raman_OLCI.txt');

      case idOLCI6WL
        usedL(1)=2; usedL(2)=3; usedL(3)=4; usedL(4)=5; usedL(5)=6; usedL(6)=8;  
        nomlut=readtable('param_lutsOLCI.csv');
        nomlut=table2array(nomlut(1:3,1:8));
        nomLutRaman=load('lut_Raman_OLCI.txt');
        
      otherwise
        disp('Invalid Sensor')
     end

     LO=nomlut(1,usedL);
     AW=nomlut(2,usedL);
     BBW=nomlut(3,usedL);


%   /* bb look up table elaborated from Hydrolight simulation */     
  nomfic=table2array(readtable('fit_poly3_bb_Kd1vsRrs_all.txt'));
  for i=1:21
    for ii=1:8
   lut_bb(i,ii,1)=nomfic(((i-1)*8)+ii,4);
   lut_bb(i,ii,2)=nomfic(((i-1)*8)+ii,5);
   lut_bb(i,ii,3)=nomfic(((i-1)*8)+ii,6);
    end
  end
  
%   lut_bb=lut_bb(:,usedL,:);
  
%   /* a look up table elaborated from Hydrolight simulation */
  nmfic=readtable('lut_KdVSafRrs.csv');
  nomfic=table2array(nmfic);
    for ii=1:8  
          for i=1:21
  lut_a(i,ii,1)=nomfic(((ii-1)*21)+i,2);
  lut_a(i,ii,2)=nomfic(((ii-1)*21)+i,3);
  lut_a(i,ii,3)=nomfic(((ii-1)*21)+i,4);
  lut_a(i,ii,4)=nomfic(((ii-1)*21)+i,5);
    end
    end
  
%   lut_a=lut_a(:,usedL,:);  
  nomfic=nomLutRaman;
  
  lut_Raman=nomfic(:,2:end-2);
  lut_RamanMin=nomfic(:,end-1);
  lut_RamanMax=nomfic(:,end);

  lut_Raman=lut_Raman(usedL,:);
  lut_RamanMin=lut_RamanMin(usedL);
  lut_RamanMax=lut_RamanMax(usedL);         
end

