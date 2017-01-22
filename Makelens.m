function Z=Makelens(f,range,radius,pixel,lambda)
%
% Creates a lens of focal lenght f
%
% Z=Makelens(f,range,radius,pixel,lambda)


lambda=lambda.*1e-9;
diameter=2.*radius;
NA=diameter./f;
fnum=1./NA;
% [lx,Lx,Ly,dlx]=Objectplane(range,pixel); %creates xi,eta and return pixel dim
% L=Lx.^2+Ly.^2<=(radius)^2; %creates Pupil 
% r_max=sqrt(sqrt(2.*lambda.*(f.^3))); 

% if radius<=r_max
[XI,ETA,dxi]=Objectplane(range,pixel); %creates xi,eta and return pixel dim
u1=XI.^2+ETA.^2<=radius.^2; %creates Pupil 
%    control=0;
% else
%     
%     L=Makepupilr(range,pixel,r_max);
%     control=1;
% end

% r1=round(pixel./2-(radius./L.dxi))+1;
% r2=round(pixel./2+(radius./L.dxi));


% if control==1
%     radius=r_max;
% end
k=(2*pi./lambda);
%lens=L.field(r1:r2,r1:r2).*exp(-i.*(k./(2.*f).*(L.XI(r1:r2,r1:r2).^2+L.ETA(r1:r2,r1:r2).^2)));
lens=u1.*exp(-1i.*(k./(2.*f).*(XI.^2+ETA.^2)));

%keyboard
%radial coordinate

Z.lens=lens;
Z.diameter=diameter;
Z.dlx=dxi;
Z.focal=f;
Z.NA=NA;
Z.fnum=fnum;
Z.radius=diameter./2;
% Z.control=control;
% figure, imagesc( L.xi, L.xi,atan2(imag(Z.lens),real(Z.lens)));



