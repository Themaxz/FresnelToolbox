function Z=Makelenslet(f,range,radius,pixel,lambda)
%
% Creates a lens of focal lenght f
%
% Z=Makelens(f,range,diameter,pixel,lambda);
if max(size(radius))==2
    radius=radius(1);
end
[Lx,Ly,dlx]=Objectplane(range,pixel); %creates xi,eta and return pixel dim
L=Lx.^2+Ly.^2<(radius).^2; %creates Pupil 

lambda=lambda.*1e-9;

k=(2*pi./lambda);
lens=L.*exp(-i.*(k./(2.*f).*(Lx.^2+Ly.^2)));
Z=lens;


