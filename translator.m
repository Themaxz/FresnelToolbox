%translator
f=5.3e-3;
offset=-.61e-3;
start1=10.27e-3;
start2=10e-3;
offset2=-1e-3;
finish=0;
step=.1e-3;
beta=14e-3;
d1=15e-3;
d2=15e-3;
I=170e-3;
alpha=20e-3;
% M=input('M= ');
M=[0:.05:.5];

b=get_b(f,M);
x=start1-beta+b;
a=lenslaw(f,b);
D=alpha+b-a;
y=start2-D;
display(x);
display(y);

% %b=d0+start-x+offset;
% %display(b);
% clear x;
% x=beta-b-offset;
% % x=d0+start-b+offset;
% xi=start-x;
% a=lenslaw(f,b);
% temp=d2+x+offset;
% %display(temp);
% display(a);
% display(b);
% display(xi);
% y=temp-a;
% display(y);