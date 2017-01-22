clear all
clc

%plot vectors
dx=[1:1:100].*1e-7;
f=[1:1:100].*1e-3;
w=[1:1:100].*1e-3;
%parameters
% f=100e-3;

%w=5e-3;
lambda=500e-9;



max_aperture=(lambda.*f)./(4.*pi.*dx);
min_focal=(4.*pi.*w.*dx)./(lambda);
min_res=(4.*pi.*(w.^2))./(lambda.*f);
phi=(2.*pi./lambda).*dx.*(f./w);

% figure, plot(dx,max_aperture), title('aperture vs pixel size'), xlabel('resolution'), ylabel('minimum aperture');
%figure, surf(min_focal):% title('focal vs pixel size'), xlabel('resolution'), ylabel('focal') ;


