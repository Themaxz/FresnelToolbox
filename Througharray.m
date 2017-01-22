function U=Througharray(P,M,lambda)
%U=througharray(P,M,lambda)
%Calculate the optical field just after a lens L
U=P;
U.field=P.field.*M.field;
%Normalized Optical coordinate
k=2.*pi./lambda;
%U.v=k.*L.r.*L.radius;
U.lens_on=1;
