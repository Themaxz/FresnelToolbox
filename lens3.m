function Z=lens(f,range,radius,pixel,lambda)
%
% Creates a lens of focal lenght f
%
% Z=lens3(f,range,diameter,pixel,lambda);

tic;

if ~exist('range')
    range = 1e-3;
end
if ~exist('pixel')
    pixel=1000;
end
[lx,Lx,Ly,dlx]=Objectplane(range,pixel); %creates xi,eta and return pixel dim
L=Lx.^2+Ly.^2<=(radius)^2; %creates Pupil 
%a=countvalues(u1,1);
%u1=u1./a;
%x=-range:sampling:range;
%[x,y]=meshgrid(x);
%P=x.^2+y.^2<=range.^2;
if ~exist('lambda')
    lambda=600;
end
lambda=lambda.*1e-9;
%f=f.*10.^-3;
k=(2*pi./lambda);
lens=L.*exp(-i.*(k./(2.*f).*(Lx.^2+Ly.^2)));
%radial coordinate
r=sqrt(Lx.^2+Ly.^2);
Z.lens=lens;
Z.lx=lx;
Z.Lx=Lx;
Z.Ly=Ly;
Z.dlx=dlx;
Z.radius=r;
figure, imagesc( lx, lx, atan2(imag(Z.lens),real(Z.lens)));

toc

