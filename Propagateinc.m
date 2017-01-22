function U=Propagateinc(P,zeta,lambda,inc)
%Propagateinc(P,zeta,lambda,inc)
%propagates the field in an iterative way changing the phase at every step
M=max(size(P.field));    
z=getzeta(P,lambda); %calculates the propagation distance in order to keep the same resolution with 0 padding
i=zeta./z;
i=round(i);

U1=Fresnelr(P,z,lambda); %first step

for j=1:i-1 %iterative propagation in i steps

    phase=randphase2(inc,M);
    U1.field=U1.field.*phase;
    U1=Fresnelr(U1,z,lambda);
    
end

U=U1;