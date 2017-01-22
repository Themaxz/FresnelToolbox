function IMG=render_inv(L,P)
s=size(L);
Nx=s(1);
Ny=s(2);
nx=s(3);
ny=s(4);
IMG=zeros(Nx.*P);
% k0=round((nx-P)./2);
% l0=round((ny-P)./2);
% l0=ny-P;
% l=l0;
% k=k0;

t=1;

for i=1:Nx
    s=1;
    for j=1:Ny
        
%         i=round((s./Nx).*P);
%         j=round((t./Ny).*P);
%         k=rem(s,Nx).*P;
%         l=rem(t,Ny).*P;
            inf=round((ny-P)./2);
            sup=inf+P;
%         
               
       
       
        
            sub=squeeze(L(i,j,inf:sup,inf:sup));
%             IMG(t:t+P,s:s+P)=fliplr(flipud(sub));
%             IMG(s:s+P,t:t+P)=sub;
            IMG(t:t+P,s:s+P)=sub;
           s=s+P;
%             imagesc(log(IMG));
        
        
    end
t=t+P;    
end

    
    



