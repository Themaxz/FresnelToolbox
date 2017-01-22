prompt='enter magnification:';
m=input(prompt);
prompt='enter subimage size:';
pixel=input(prompt);
prompt='enter distance:';
dist=input(prompt);

w=1e-2;
P=sinvar(3000,1000,freq,10,w);

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

[SIN,image]=Pleno20_SIN(P,L,M,fmin,fmin,a,b,500,1000,500,'y',freq);
[S,rad]=LightField(PS.field, sqrt(M.num_lenslet));
pitch=M.pixel.*m;
sez1=sez_rad(rad);

ni=1./(500.1e-9.*F1);
m=b./a;
pitch=round(M.pixel.*b./a);
IMG=render(rad,pitch);
DATA=freq_analisys_sum(image,IMG,P.dxi,ni,m);