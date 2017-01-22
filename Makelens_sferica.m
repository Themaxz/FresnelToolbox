function Z=Makelens_sferica(f,range,radius,pixel,lambda)
%
% Creates a lens of focal lenght f
%
% Z=Makelens(f,range,radius,pixel,lambda)
tic;

lambda=lambda.*1e-9;
% [lx,Lx,Ly,dlx]=Objectplane(range,pixel); %creates xi,eta and return pixel dim
% L=Lx.^2+Ly.^2<=(radius)^2; %creates Pupil 
r_max=sqrt(sqrt(2.*lambda.*(f.^3))); 

if radius<=r_max
   L=Makepupilr(range,pixel,radius);
   control=0;
else
    
    L=Makepupilr(range,pixel,r_max);
    control=1;
end

% r1=round(pixel./2-(radius./L.dxi))+1;
% r2=round(pixel./2+(radius./L.dxi));


if control==1
    radius=r_max;
end
k=(2*pi./lambda);
%lens=L.field(r1:r2,r1:r2).*exp(-i.*(k./(2.*f).*(L.XI(r1:r2,r1:r2).^2+L.ETA(r1:r2,r1:r2).^2)));
lens=L.field.*exp(i.*(k./(2.*f).*sqrt(1-(L.XI.^2+L.ETA.^2))));
z=linspace(0,2.*pi,pixel+1);
%keyboard
ZETA=meshgrid(z);
%radial coordinate
r=radius;
Z.lens=lens;
Z.lx=L.xi;
Z.Lx=L.XI;
Z.Ly=L.ETA;
Z.dlx=L.dxi;
Z.radius=r;
figure, imagesc( L.xi, L.xi,atan2(imag(Z.lens),real(Z.lens)));

toc

