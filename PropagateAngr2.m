function U=PropagateAngr2(P,zeta,lambda)

%U=Propagate(P,zeta,lambda)
% Propagates the field P for a distance zeta at a wavelenght lambda in an iterative mode
%using angular spectrum approach.


z=getzeta(P,lambda); %calculates the propagation distance in order to keep the same resolution with 0 padding

i=zeta./z;

i=round(i);

U1=Angular2(P,z,lambda); %first step

for j=1:i-1 %iterative propagation in i steps

    U1=Angular2(U1,z,lambda);

end
% figure, subplot(1,2,1), imagesc(P.xi,P.xi,abs(P.field)), axis square, subplot(1,2,2),imagesc(U1.xi,U1.xi,abs(U1.field)), axis square;
U=U1;




    
