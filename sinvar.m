function S=sinvar(size,fmin,fmax,num,w)
P=Makepupil(w,size-1,w./4);
x=[0:P.dxi:w./num];
deltaf=(fmax-fmin)./num;
deltap=round(size./num);
SIN=zeros(1,size);
m=1;
k=0;
for i=1:num
    ind=i.*deltap;
    freq=fmin+(k.*deltaf);
    SIN(1,m:ind)=.5+.5.*sin(2.*pi.*freq*x);
    m=m+deltap;
    k=k+1;
    S.freq(i) = freq;
end

S=P;
[S1,S2]=meshgrid(SIN);
S.field=S1;


