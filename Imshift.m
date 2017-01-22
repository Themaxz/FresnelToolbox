function IMG=Imshift(A,alpha,num_lenslet)
s=max(size(A));
a=(1-1./alpha); %shift
u_max=s./num_lenslet; %pixel direzinali sottesi da ogni microlente
v_max=u_max; %e anche pari al numero di subimmagini
pace=num_lenslet;
nu=[-pace./2:1:pace./2]; %vettore shift in pixel dimensione di ogni subimmagine
[NU, ETA]=meshgrid(nu);
U=[-u_max./2:1:u_max./2];
V=U;
U=U.*a; %vettori shift
V=V.*a;
%keyboard
IMG=zeros(pace+1);
 k=0;
%  keyboard
u=0;
v=u;
k=1;
% keyboard
for i=1:pace:s-pace
    u=u+1;
    for j=1:pace:s-pace
        v=v+1;
        sub=A(i:i+pace,j:j+pace);
        
        fI=ft0(sub);
        
%         if v==3
%             keyboard
%         end 
        IMG=IMG+(ift0(fI.*exp(1i*2*pi.*((U(u).*NU)./alpha+(V(v).*ETA)./alpha)))./(alpha.^2));
    
%       keyboard
        P(:,:,k)=IMG;
        k=k+1;
    
    end 
    v=0;
end

   %k
