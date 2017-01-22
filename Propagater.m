function [U,z]=Propagater(P,zeta,lambda)

%U=Propagate(P,zeta,lambda)
% Propagates the field P for a distance zeta at a wavelenght lambda in an iterative mode.


z=getzeta(P,lambda); %calculates the propagation distance in order to keep the same resolution with 0 padding

i=zeta./z;

i=round(i);

U1=Fresnel(P,z,lambda); %first step

for j=1:i-1 %iterative propagation in i steps

    U1=Fresnel(U1,z,lambda);
    
end

U=U1;




    
