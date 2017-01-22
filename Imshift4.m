function [IMG,P,U]=Imshift4(A,alpha,num_lenslet)
s=max(size(A));
a=(1-(1./alpha)); %shift
u_max=floor(s./num_lenslet); %pixel direzinali sottesi da ogni microlente
v_max=u_max; %e anche pari al numero di subimmagini
pace=num_lenslet;
fx=[0:1/num_lenslet:(num_lenslet-1).*1./num_lenslet]; %vettore shift in pixel dimensione di ogni subimmagine
[FX, FY]=meshgrid(fx);
U=[-(u_max-1)./2:1:(u_max-1)./2];
V=U;
U=U.*a; %vettori shift
V=V.*a;
%  keyboard
IMG=zeros(num_lenslet);
 k=0;
%    keyboard
u=0;
v=u;
k=1;

for i=1:pace:s
    u=u+1;
    for j=1:pace:s
        v=v+1;
        sub(:,:,k)=A(i:i+pace-1,j:j+pace-1); 
%         keyboard
        fI=ft0(sub(:,:,k));
        
%       if v==3
%              keyboard
%         end 
        IMG=IMG+abs(ift0(fI.*exp(1i*2*pi.*((U(u).*FX)./alpha+(V(v).*FY)./alpha)))./(alpha.^2));
        IMG=IMG./max(max(IMG));
%       keyboard
        P(:,:,k)=IMG;
        k=k+1;
    
    end 
    v=0;
end

   %k
