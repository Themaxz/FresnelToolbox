function P=phase(dim,f,lambda,pixel)

%Z=phase(dim,f)
lambda=lambda.*1e-9;
k=2.*pi./lambda;

x=linspace(-dim./2,dim./2,pixel);
[X,Y]=meshgrid(x);
Z1=(k/(2.*f)).*sqrt(1-(X.^2+Y.^2));
Z2=(k./(2.*f)).*(X.^2+Y.^2);
%figure, mesh(x,x,Z);
% phase1=exp(-i.*Z1);
% phase2=exp(-i.*Z2);
% P.phase1=atan2(imag(phase1),real(phase1));
% P.phase2=atan2(imag(phase2),real(phase2));
P.z1=Z1;
P.z2=Z2;