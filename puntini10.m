w=0.003;
%lens
P=Makepupil(w,2999,1e-3);
L=Makelens(120e-3,0.005,0.002,2999,633);
%microarray
M=Makearray_p(2e-3,40,0.002,2999,633);
%Airy disk dimention
[pix,lenght]=AiryPattern(M.lens_diameter,M.focus,633,M.res);
%Axial resolution
dz=(2+M.pixel).*633e-9./((2.*M.NA).^2);
z=-0.1:dz:0.1;
x=linspace(-w./2,w./2,sqrt(M.num_lenslet));
[X,Y,Z]=meshgrid(x,x,z);

P.field=zeros(3000);
%definition of the volume to image
prompt='depth: ';
zeta=input(prompt);
prompt='sources:';
num_sources=input(prompt);
prompt='coordinates source 1 [x,y,z]: ';
c1=input(prompt);
P1=P;
pix1=round(c1./P.dxi);

P1.field(1500+pix1(1),1500+pix1(2))=1;

prompt='coordinates source 2: ';
c2=input(prompt);
P2=P;
pix2=round(c2./P.dxi);
P2.field(1500+pix2(1),1500+pix2(2))=1;

prompt='coordinates source 3: ';
c3=input(prompt);
P3=P;
pix3=round(c3./P.dxi);
P3.field(1500+pix3(1),1500+pix3(2))=1;




F1=IncoherentPlenoBL_save(P1,L,M,fmin+c1(3),fmin,M.focus,500,1,500);
F2=IncoherentPlenoBL_save(P2,L,M,fmin+c2(3),fmin,M.focus,500,1,500);
F3=IncoherentPlenoBL_save(P3,L,M,fmin+c3(3),fmin,M.focus,500,1,500);
% save  (strcat(date,'tomography10.mat'));
def1=c1(3);
def2=c3(3);
raw=abs(F1.field)+abs(F2.field)+abs(F3.field);
t1=get_T(fmin./2,def1);
t2=get_T(fmin./2,def2);
[S,rad]=LightField(raw,sqrt(M.num_lenslet));
IMG=integIMG(rad);
IMG1=integIMG(shear1(rad,dq,dp,t1));
IMG2=integIMG(shear1(rad,dq,dp,t2));
x=linspace((-w./2),(w./2),round(sqrt(M.num_lenslet)));
y=x;
z=-0.15:0.01:0.15;
[X,Y,Z]=meshgrid(x,y,z);
sup=max(size(z));
for i=1:sup
    focal_stack(:,:,i)=integIMG(shear1(rad,dq,dp,z(i))); %#ok<SAGROW>
end
volume=focal_stack;

save (strcat(date,'tomography10_2.mat'));
