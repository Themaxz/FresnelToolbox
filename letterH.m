function U=letterH(range,pixel,width)
[xi,XI,ETA,dxi]=Objectplane(range,pixel-1);
u1=zeros(pixel);

x1=round(pixel./3);
x2=2.*x1;
y1=round(pixel./4);
y2=y1.*3;
xc=round(pixel./2);

u1(y1:y2,x1:x1+width)=1;
u1(y1:y2,x2:x2+width)=1;
u1(xc-(width./2):xc+(width./2),x1:x2)=1;

U.field=u1;
U.xi=xi;
U.dxi=dxi;
U.DXI=range;
