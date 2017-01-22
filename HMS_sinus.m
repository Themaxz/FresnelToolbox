w=1e-2
L=Makelens(0.06,0.01,0.002,2999,633);
M=Makearray_p(40e-3,150,w,2999,633);
a=120e-3
b=LensLaw(M.focus,a)
x=linspace((-w./2),(w./2),3000);
[X,Y]=meshgrid(x);
SIN=0.5+0.5.*sin(5000.*X);
P=Makepupil(1e-2,2999,1e-4);
P.field=SIN;
[SIN1,image1]=Pleno20_SIN(P,L,M,120e-3,120e-3,a,b,633,250,500,'y',5000);


SIN=0.5+0.5.*sin(10000.*X);
P=Makepupil(1e-2,2999,1e-4);
P.field=SIN;
[SIN2,image2]=Pleno20_SIN(P,L,M,120e-3,120e-3,a,b,633,250,500,'y',10000);

[S1,rad1]=LightField(SIN1.field,sqrt(M.num_lenslet));
[S2,rad2]=LightField(SIN2.field,sqrt(M.num_lenslet));

IMG1=render(rad1,pitch);
IMG2=render(rad2,pitch);