function U=throughlens(P,L,lambda)
%U=throughlens(P,L,lambda)
%Calculate the optical field just after a lens L
%s=max(size(P.field));
%L=Makelens(f,d,r,s-1,lambda);
%keyboard
U=P;
U.field=P.field.*L.lens;
%Normalized Optical coordinate
k=2.*pi./lambda;
%U.v=k.*L.r.*L.radius;
%U.lens_on=1;
