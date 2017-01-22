function x=Normalizza1(y)
%x=Normalizza1(y)
%normalize to one y array
y=y-min(y(:));
y=y./max(y(:));
x=y;
