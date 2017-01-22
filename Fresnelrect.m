function U=Fresnel(U1,z,lambda)
%
% Get the scalar field u1 and makes it propagate for a distance z
%
% U = Fresnel(U1,z,lambda)
% default lambda = 633 nm
% U1 is a struc:
 

% U.field=U3;
% U.f=f;
% U.fx=fx;
% U.fy=fy;
% U.F=F;
% U.dF=dF;
% U.dxi=dx;
% U.XI=x;
% U.ETA=y;
% U.DXI=DX;
% U.xi=x1;

tic
if ~exist('lambda')
    lambda=633;
    lambda=lambda*1e-9;
else
    lambda=lambda*1e-9;
end

m=size(U1.field);
%M=max(size(U1.field));
k=2*pi./lambda;

n=(1/(m.(1).*m(2)));
c=1/(1i.*z.*lambda);
Uout=(U1.field).*exp((1i.*k./(2.*z)).*(U1.XI.^2+U1.ETA.^2));
u2=m.*ft0(Uout);
U2=c.*u2;
%U2=u2;
%spazial frequency vector
S=size(U1.field);
dFx=1/(m(1).*U1.dxi); 
dFy=1/(m(2).*U1.deta);
S1=size(U2);
FX=dFx.*(S1(1)-1);
f=(-F./2):dF:(F/2);
[fx,fy]=meshgrid(f);
FY=dFy.*(S1(2)-1);



%back to linear coordinates

DX=FX.*lambda.*z;
dx=dF.*lambda.*z;
x1=(-DX./2):dx:(DX/2);
[x,y]=meshgrid(x1);
DY=FY.*lambda.*z;
dy=dFy.*lambda.*z;
y1=(-DX./2):dx:(DX/2);
[xy,yy]=meshgrid(y1);

phase=exp(i.*k.*z).*exp(i.*(k./(2*z)).*(x.^2+yy.^2));
U3=phase.*U2;

figure, subplot(1,2,1), imagesc(U1.xi,U1.xi,abs(U1.field)), axis square, subplot(1,2,2),imagesc(x1,y1,abs(U3)), axis square; 

U.field=U3;
U.f=f;
U.fx=fx;
U.fy=fy;
U.F=F;
U.dF=dF;
U.dxi=dx;
U.XI=x;
U.ETA=y;
U.DXI=DX;
U.xi=x1;

U.size=size(U3);
% if U1.lens_on==1
%     U.v=U1.v./z;
% end

toc
