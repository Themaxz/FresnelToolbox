prompt='enter magnification:';
m=input(prompt);
prompt='enter subimage size:';
pixel=input(prompt);
prompt='enter distance point sources:';
dist=input(prompt);

w=1e-2;

P=Makepupil(w,2999,2e-3);
d=round(dist./P.dxi);
P.field=zeros(3000);
P.field(1500,1500-(d./2))=1;
P.field(1500,1500+(d./2))=1;
fmin=4.*pi.*w.*P.dxi./(500e-9);

fmicro=40e-3;
M=Makearray_p(fmicro,pixel,w,2999,500);

switch m
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

[YG,fringe]=Pleno20_YOUNG(P,L,M,fmin,fmin,a,b,500,1,500,'y',dist);
[S,rad]=LightField(PS.field, sqrt(M.num_lenslet));
pitch=M.pixel.*m;
sez1=sez_rad(rad);
