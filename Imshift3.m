function [IMG,P,U]=Imshift3(A,sub,alpha,num_lenslet)
s=max(size(A));
a=(1-1./alpha); %shift
u_max=s./num_lenslet; %pixel direzinali sottesi da ogni microlente
v_max=u_max; %e anche pari al numero di subimmagini
pace=num_lenslet;
fx=linspace(-pace./(2*num_lenslet),pace./(2*num_lenslet),100); %vettore shift in pixel dimensione di ogni subimmagine
[FX, FY]=meshgrid(fx);
U=linspace(-u_max./2,u_max./2,u_max);
V=U;
U=U.*a; %vettori shift
V=V.*a;
% keyboard
IMG=zeros(pace);
 k=0;
%   keyboard
u=0;
v=u;
k=1;
% keyboard
for i=1:pace:s
    u=u+1;
    for j=1:pace:s
        v=v+1;
%         sub=A(i:i+pace,j:j+pace);
%         K(:,:,k)=sub;
        fI=ft0(sub(:,:,k));
        
%         if v==3
%             keyboard
%         end 
        IMG=IMG+abs(ift0(fI.*exp(1i*2*pi.*((U(u).*FX)./alpha+(V(v).*FY)./alpha)))./(alpha.^2));
    
%       keyboard
        P(:,:,k)=IMG;
        k=k+1;
    
    end 
    v=0;
end

   %k
