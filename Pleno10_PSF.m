function PSF=Pleno10_PSF(rad,L,M,lambda)
DOF=(2+M.pixel).*lambda.*1e-9./(2.*L.NA.^2);
w=M.w;
z=-0.1:DOF:0.1;
x=linspace(-w./2,w./2,sqrt(M.num_lenslet));
[X,Y,Z]=meshgrid(x,x,z);
n=max(size(z));
dx=M.res;
NA=M.lens_diameter./M.focus;
dp=NA./M.pixel;
for i=1:n
    FS(:,:,i)=integIMG(shear1(rad,dx,dp,get_T(L.focal,z(i))));
end
PSF.psf=FS./max(max(max(FS)));
PSF.X=X;
PSF.Y=Y;
PSF.Z=Z;
PSF.dz=DOF;
