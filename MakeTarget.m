function T=MakeTarget(dim,pixel)
[xi,XI,ETA,dxi]=Objectplane(dim,pixel);
x=linspace(0,1,1001);
u1=sin(2.*x);
%u1=sin(XI)+cos(ETA); 

figure, imagesc(xi,xi,u1),axis square;
T.field=u1;
T.xi=xi;
T.XI=XI;
T.ETA=ETA;
T.dxi=dxi;
T.DXI=dim;
T.lens_on=0;