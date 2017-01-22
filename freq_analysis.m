function DATA=freq_analysis(image,IMG,dxi,m)
%frequency vector
M=max(size(image));
df=1./(M.*dxi);
fmax=df.*(M-1);
f=[-(fmax./2):df:fmax./2]; %#ok<BDSCA>
%spatial vectro
x=[(-dxi.*(M-1))./2:dxi:(dxi.*(M-1))./2];
%profile
%p1=image(round(M./2),:);
p1 = sum(image,2);
p1 = p1./max(p1(:));

Mi=max(size(IMG));
img=imresize(IMG,M./Mi);
p2 = sum(img,2);
%2=img(round(M./2),:);
p2 = p2./max(p2(:));


pf1=ft0(p1);
pf2=ft0(p2);
figure, plot(x,p1,'b'), title(strcat('Impulse response m = ',num2str(m)));
 xlabel('x (m)');
 ylabel('Normalized Intensity (a.u)');
hold on
plot(x,p2,'r');
legend;
hold off
axis([-1e-3 1e-3 0 1]);
export_fig(strcat('IR',num2str(m),'.eps'),'-eps','-transparent');

figure, plot(f,abs(pf1)./max(abs(pf1)),'g'),title(strcat('Frequency responce m = ',num2str(m)));
 xlabel('Spatial Frequency (1/m)');
 ylabel('Normalized Power (a.u)');
hold on
plot(f,abs(pf2)./max(abs(pf2)),'r');
hold off
axis([0 1e5 0 1]);
export_fig(strcat('MTF',num2str(m),'.eps'),'-eps','-transparent');

DATA.p1=p1;
DATA.p2=p2;
DATA.fp1=pf1;
DATA.fp2=pf2;
DATA.f=f;
DATA.df=df;


