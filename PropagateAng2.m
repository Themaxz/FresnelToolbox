function U=PropagateAng2(P,zeta,lambda)

%U=Propagate(P,zeta,lambda)
% Propagates the field P for a distance zeta at a wavelenght lambda in an iterative mode
%using angular spectrum approach.


z=getzeta(P,lambda); %calculates the propagation distance in order to keep the same resolution with 0 padding

n=zeta./z;

i=floor(n);
z1=zeta.*(n-i);
frame(:,:,1)=P.field;
U1=Angular(P,z,lambda); %first step
frame(:,:,2)=U1.field;
for j=1:i-1 %iterative propagation in i steps

    U1=Angular(U1,z,lambda);
    control(j)=j.*z;
    frame(:,:,j+2)=U1.field;
    
end
% pad=GetPadding(max(size(P.field)),z1,lambda,P.DXI);
% keyboard
% U2=padarray(U1,[pad./2 pad./2]);
U1=Angular(U1,z1,lambda);
% ratio=U1.dxi./P.dxi;
% fU=ft0(U1.field);
% U2=ift0((1./(ratio.^2)).*fU./ratio);
% U1.field=U2;
% figure, subplot(1,2,1), imagesc(P.xi,P.xi,abs(P.field)), axis square, subplot(1,2,2),imagesc(P.xi,P.xi,abs(U1.field)), axis square;
U=U1;
U.zeta=((j+1).*z)+z1;



    
