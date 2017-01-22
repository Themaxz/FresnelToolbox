%focal stack
%parameters
dz=(2+M.pixel).*633e-9./((2.*M.NA).^2);
z=-10.*dz:dz:10.*dz;
x=linspace(-w./2,w./2,sqrt(M.num_lenslet));
[X,Y,Z]=meshgrid(x,x,z);
%focal stak
MAX=max(size(z));
N=sqrt(M.num_lenslet);
FS=zeros(N,N,MAX);
for i=1:MAX
    FS(:,:,i)=integIMG(shear2(rad,w,M.NA,get_T(L.focal,z(i))));
end
FS=FS./max(max(max(FS)));


