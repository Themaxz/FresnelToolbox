function DATA=freq_analysis_thesis(image,IMG,dxi,m)
%frequency vector
M=max(size(image));
df=1./(M.*dxi);
fmax=df.*(M-1);
f=[-(fmax./2):df:fmax./2]; %#ok<BDSCA>
%spatial vectro
x=[(-dxi.*(M-1))./2:dxi:(dxi.*(M-1))./2];
%profile
p1=zeros(1,M);
res = size(image);
for i=500:res(1)-500
    
    buffer=image(i,:);
    p1=p1+buffer;

end    
Mi=max(size(IMG));
img=imresize(IMG,M./Mi);
p2=zeros(1,M);
for i=500:res(1)-500
    
    buffer=img(i,:);
    p2=p2+buffer;

end    
pf1=ft0(p1);
pf2=ft0(p2);
figure, plot(x,p1,'b');
hold
plot(x,p2,'r');
figure, plot(f,abs(pf1),'g');
hold
plot(f,abs(pf2),'r');
DATA.p1=p1;
DATA.p2=p2;
DATA.fp1=pf1;
DATA.fp2=pf2;
DATA.f=f;
DATA.df=df;

