prompt='enter magnification:';
m=input(prompt);
prompt='enter subimage size:';
pixel=input(prompt);
prompt='enter distance:';
dist=input(prompt);

w=1e-2;
P=Makepupil(w,2999,2e-3);
P1=P;
P.field=zeros(3000);
P.field(1500,1500)=1;
pd=round(dist./P.dxi);
P1.field=zeros(3000);
P1.field((1500-(pd./2)),:)=1;
P1.field((1500+(pd./2)),:)=1;

fmin=4.*pi.*w.*P.dxi./(500e-9);

fmicro=40e-3;
M=Makearray_p(fmicro,pixel,w,2999,500);

switch m
    case 1
        b=2.*(M.focus);
        
    case 0.5
        
        b=(3./2).*(M.focus);
    case 0.3
        b=(4./3).*M.focus;
    case 0.25
        b=(5./4).*M.focus;
    otherwise
        error('wrong magnification input')
end
F2=b./(M.lens_diameter);
a=LensLaw(M.focus,b);
radius=fmin./(2.*F2);
L=Makelens(fmin./2,w,radius,2999,500);
F1=fmin./(2.*L.radius);
P1_=AngularBL(P,5e-2,500);
P1.field=P1_.field.*P1.field;
[YNG,image]=Pleno20_YOUNG(P1,M,fmin,a,b,500,1,500,'y',dist);
[S,rad]=LightField(YNG.field, sqrt(M.num_lenslet));

sez1=sez_rad(rad);

ni=1./(500.1e-9.*F1);
m=b./a;
pitch=round(M.pixel.*b./a);
IMG=render(rad,pitch);
DATA=freq_analisys_sum(image,IMG,P.dxi,ni,m);