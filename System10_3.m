w=0.005;
%lens
W=1e-6.*Zernike(3,-1,2999);
lambda=633.*1e-9;
L=Makelens(60e-3,0.005,0.002,2999,633);
L.lens=L.lens.*exp(-1i.*(2.*pi./lambda).*W);
%microarray
M=Makearray_p(2e-3,40,0.002,2999,633);
%Airy disk dimention
[pix,lenght]=AiryPattern(M.lens_diameter,M.focus,633,M.res);
%Axial resolution
dz=(2+M.pixel).*633e-9./((2.*M.NA).^2);
z=-0.1:dz:0.1;
x=linspace(-w./2,w./2,sqrt(M.num_lenslet));
[X,Y,Z]=meshgrid(x,x,z);

%point source
P=Makepupil(w,2999,0.001);
P.field=ones(3000);
% P.field(1000:1800,1300:1400)=1;
% P.field(1800:2000,2000:2400)=1;

 
%propagation distances
z1=L.focal.*2;
z2=z1;
% z1=160e-3;
z3=M.focus;
dx=M.res;
dp=M.NA./M.pixel;

%Fresnel propagation
P1=AngularBL(P,z1,633);
P2=throughlens(P1,L,633);
P3=AngularBL(P2,z2,633);
image=abs(P3.field).^2;
P3.field=P3.field.*M.field;
P4=AngularBL(P3,z3,633);
raw=abs(P4.field).^2;

%Light Field
% [S,rad]=LightField(raw,sqrt(M.num_lenslet));
% IMG=integIMG(rad);
% sez=sez_rad(rad);

% %focal stack
% MAX=max(size(z));
% N=sqrt(M.num_lenslet);
% FS=zeros(N,N,MAX);
% for i=1:MAX
%     FS(:,:,N)=integIMG(shear(
% 




 
 
 
 