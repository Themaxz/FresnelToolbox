function IMG=render_aberration(raw,pitch,num_lenslet,x_shift,y_shift)
s=size(raw);
Nx=s(1);
Ny=s(2);

pix=Nx./num_lenslet; %resolution of the sub image
                                
% IMG=zeros(Nx.*pitch);
% k0=round((nx-P)./2);
% l0=round((ny-P)./2);
% l0=ny-P;
% l=l0;
% k=k0;

t=1;

for i=1:num_lenslet-1
    s=1;
    for j=1:num_lenslet-1
        
%         i=round((s./Nx).*P);
%         j=round((t./Ny).*P);
%         k=rem(s,Nx).*P;
%         l=rem(t,Ny).*P;
            
          inf=round((pix-pitch)./2);
          sup=inf+pitch;
%              
        
            sub=select_sub(raw,i,j,pix);
            
            middle_pix_x = (pix./2)+x_shift(i,j);
            middle_pix_y = (pix./2)+y_shift(i,j);
            
            sub=sub(middle_pix_x-(pitch./2):middle_pix_x+(pitch./2),middle_pix_y-(pitch./2):middle_pix_y+(pitch./2));
%                  
            IMG(t:t+pitch,s:s+pitch)=rot90(sub,2);
%             IMG(s:s+P,t:t+P)=sub;
%             IMG(t:t+P,s:s+P)=sub';
           s=s+pitch;
%             imagesc(log(IMG));
%         IMG(t:t+P,s:s+P)=fliplr(flipud(sub));
        
    end
t=t+pitch;    
end

    
    



