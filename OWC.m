function [class] = OWC(spectre)

%%%run classification
for i=1:17
    if i<10
mu(:,i)=load(['LUT\mu_Stat16ClassCoastal_0' num2str(i) '.txt']);        
    else     
mu(:,i)=load(['LUT\mu_Stat16ClassCoastal_' num2str(i) '.txt']);
    end
end

for i=1:17
    if i<10
    mu_cov(:,:,i)=load(['LUT\CovMat_Stat16ClassCoastal_0' num2str(i) '.txt']); 
    else
    mu_cov(:,:,i)=load(['LUT\CovMat_Stat16ClassCoastal_' num2str(i) '.txt']);    
    end
end
wl=[412 444 490 510 560 666];
X=mu;X=X';
     
surf1=0;
for o=1:5
    surf1=surf1+(wl(o+1)-wl(o)).*(spectre(:,o+1)+spectre(:,o))./2;
end
Y=real(log10(spectre./surf1));

for iii=1:17
    dist(:,iii)=pdist2(X(iii,:),Y,'mahalanobis',mu_cov(:,:,iii));
end
[M,I]=min(dist');
I(find(isnan(dist(:,1))>0))=NaN;
M(find(isnan(dist(:,1))>0))=NaN;
class=I;

end