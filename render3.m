function IMG = render3( L,P )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

s=size(L);
nx=s(3);
ny=s(4);
Nx=s(1);
Ny=s(2);
dim=P.*Nx;
% IMG=zeros(dim);
inf=round((ny-P)./2);
sup=inf+P;
s=1;
t=1;
for i=1:Nx
    
    for j=1:Ny
        
        
        IMG(s:s+P,t:t+P)=squeeze(L(i,j,inf:sup,inf:sup));
        if s<=Nx.*P
            s=s+P;
        end
        if t<=t+P
        
            t=t+P;
        end

        
        
% k=k+1
% size(IMG)
        
   
    end
%     figure, imagesc(IMG)
    if t<=t+P
        
            t=t+P;
        end


end

