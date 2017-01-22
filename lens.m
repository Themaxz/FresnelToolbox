function z=lens(f,range,sampling,lambda)
%
% Creates a lens of focal lenght f
%
% L = Lens(f,range,sampling,lambda);
% default range=1 , sample=0.01, lambda = 600 nm

if ~exist('range')
    range = 0.5;
end
if ~exist('sampling')
    sampling = 0.001;
end
x=-range:sampling:range;
[x,y]=meshgrid(x);
P=x.^2+y.^2<=range.^2;
if ~exist('lambda')
    lambda=600;
end
lambda=lambda.*10.*exp(-9);
k=(2*pi./lambda);
z=P.*exp(-i.*(k./(2.*f).*(x.^2+y.^2)));
figure, mesh( x, y, atan2(imag(z),real(z)));


