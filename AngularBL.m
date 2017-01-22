function U=AngularBL(U1,z,lambda)
%
% Get the scalar field u1 and makes it propagate for a distance z
% using angular spectrum approach
% U=Angular(U1,z,lambda)
% 
% default lambda = 633 nm
% U1 is a struct

if ~exist('lambda')
    lambda=633;
    lambda=lambda*1e-9;
else
    lambda=lambda*1e-9;
end

M=max(size(U1.field));
M1=size(U1.field);
% ratio=M./max(size(U1.xi));
% dxi=U1.dxi./ratio;
k=2*pi./lambda;
n=(1./(M.^2));
c=1/(1i.*z.*lambda);

%spatial frequency vector
S=size(U1.field);
dF=1./(S.*U1.dxi); 
S1=size(U1.field);
F=dF.*(S1-1);

fx=(-F(1)./2):dF(1):(F(1)./2);
fy=(-F(2)./2):dF(2):(F(2)./2);
[fx,fy]=meshgrid(fy,fx);

%angular spectrum
A1=ft0(U1.field);

%transfer function
H=exp(i.*2*pi.*(z./lambda).*sqrt(1-(lambda.*fx).^2-(lambda.*fy).^2));

%band limited H
umax=(1./(sqrt((2.*dF.*z).^2+1).*lambda));
val=round(umax./dF);
if max(val)<max(M)
    r=Makepupil(F,M1,umax);
    %r=Makepupil(F,S1(1)-1,umax);
    H=H.*r.field;
    A2=A1.*H;
else
    A2=A1.*H;
end
U3=ift0(A2);

%back to linear coordinates questo non e piu vero se utilizzo lo spettro
%angolare!!!

% DX=F.*lambda.*z;
% dx=DX./(S1(1)-1);
% x1=(-DX./2):dx:(DX/2);
% [x,y]=meshgrid(x1);

U.field=U3;
U.F=F;
U.DXI=U1.DXI;
U.dxi=U1.dxi;
% U.xi=U1.xi;
U.size=size(U3);


