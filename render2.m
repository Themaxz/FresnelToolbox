function IMG = render2( S,P )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

s=size(S);
nx=s(1);
ny=s(2);
tot=s(3);
dim=P.*sqrt(tot);
IMG=zeros(dim);
inf=round((ny-P)./2);
sup=inf+P;
k=1;
for i=1:P:dim %#ok<BDSCI>
    
    for j=1:P:dim
        
        buffer=S(inf:sup,inf:sup,k);
        IMG(i:i+P,j:j+P)=flipud(buffer);
        
        if k<tot
        
            k=k+1;
        
        end
        
   
    end
%     figure, imagesc(IMG)
    


end

