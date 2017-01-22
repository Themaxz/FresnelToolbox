lambda=633e-9;

f=5e-2;

k=2.*pi./lambda;
N=[0,1,2,3,4]; 
n=N';
lim=sqrt(2.*lambda.*f);
x=linspace(-5.*lim./2,5.*lim./2,1001);
y=k./(2.*f).*x.^2;
ys=k./(2.*f).*(sqrt(1-x.^2));
% figure, p=plot(x,y,'b');
PHI=exp(-1i.*y);
phase=atan2(imag(PHI),real(PHI))+pi;
PHIs=exp(-1i.*ys);
phases=atan2(imag(PHIs),real(PHIs));
figure, p=plot(x,y,'b',x,phase,'r')%,x,ys,'g',x,phases,'c');
set(gca,'YTick',pi:2.*pi:10.*pi)
set(gca,'YTickLabel',{'pi','3pi','5pi','7pi','9pi'})
figure, q=plot(x,ys,'g',x,phases,'c');
set(gca,'YTick',pi:2.*pi:10.*pi)
set(gca,'YTickLabel',{'pi','3pi','5pi','7pi','9pi'})

j=1;
N=(1:1:5)';
Xn=sqrt((2.*n+1).*lambda.*f);
% for i=1:200:1001
% 
%     N(i)=Xn(j);
%     j=j+1;
% end
% Xmenon=-Xn;
% for i=1:21
Yn=inverti(Xn);
X=cat(1,Yn,Xn);    

set(gca,'XTick',X)
%set(gca,'XTickLabel',{'0','pi','2pi','3pi','4pi','5pi'})
% xlabel('-\pi \leq \Theta \leq \pi')
% ylabel('sin(\Theta)')
% title('Plot of sin(\Theta)')
