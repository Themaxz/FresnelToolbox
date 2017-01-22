function U=Fresnel(U1,z,lambda)
%
% Get the scalar field u1 and makes it propagate for a distance z
% using the fresnel integral method
%
% u2 = Fresnel(U1,z,lambda)
% default lambda = 633 nm
% U1 is a struct

if ~exist('lambda')
    lambda=633;
    lambda=lambda*1e-9;
else
    lambda=lambda*1e-9;
end

M=max(size(U1.field));
k=2*pi./lambda;
n=(1/(M.^2));
c=1/(1i.*z.*lambda);
Uout=(U1.field).*exp((1i.*k./(2.*z)).*(U1.XI.^2+U1.ETA.^2));
u2=1/(M.^2).*ft0(Uout);
U2=c.*u2;

%spazial frequency vector
S=size(U1.field);
dF=1/(M.*U1.dxi); 
S1=size(U2);
F=dF.*(S1(1)-1);
f=(-F./2):dF:(F/2);
[fx,fy]=meshgrid(f);



%back to linear coordinates

DX=F.*lambda.*z;
dx=DX./(S1(1)-1);
x1=(-DX./2):dx:(DX/2);
[x,y]=meshgrid(x1);

%phase
phase=exp(i.*k.*z).*exp(i.*(k./(2*z)).*(x.^2+y.^2));
U3=phase.*U2;

ratio=U1.dxi./dx;
if ratio~=1
    
    fU=ft0(U3);
    U2=ift0((1./(ratio.^2)).*fU./ratio);
    U1.field=U2;
end
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


