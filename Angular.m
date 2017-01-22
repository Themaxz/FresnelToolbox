function U=Angular(U1,z,lambda)
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
k=2*pi./lambda;
n=(1/(M.^2));
c=1/(1i.*z.*lambda);

%spatial frequency vector
S=size(U1.field);
dF=1/(M.*U1.dxi); 
S1=size(U1.field);
F=dF.*(S1(1)-1);
f=(-F./2):dF:(F/2);
[fx,fy]=meshgrid(f);

%angular spectrum
A1=ft0(U1.field);

%transfer function
H=exp(i.*2*pi.*(z./lambda).*sqrt(1-(lambda.*fx).^2-(lambda.*fy).^2));
A2=A1.*H;
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
U.xi=U1.xi;
U.size=size(U3);


