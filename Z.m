function out = Z(n,l,rho,theta)

% Z(n,l,x,y) calculates the Zernike polynomial Z(n,l) where n is the radial
% order and l is the azimuthal order, based on coordinates (rho,theta)
% obtained from transforming (x,y) to polar coordinates
%
% (rho,theta) are coordinates obtained from meshgrid of (x1, y1) where x1 and y1
% are vectors representing the axis, and then transforming to polar
% coordinates
%
% INPUTS:
%   n = radial order
%   l = azimuthal order
%   [x,y] = meshgrid(x1,y1) where x1 and y1 are vectors representing axis
%
% S Gruppetta, 02/2008

if ((mod(mod(n-l,2),2) ~= 0) || abs(l) > abs(n) || n < 0)
    out = [];
    error('ORDER ERROR --- Incorrect combination of radial and azimuthal orders');
end

theta = -theta; %Matlab theta goes the opposite way to ophthalmic convention

if l==0
    N = sqrt((n+1));
else
    N = sqrt(2*(n+1));
end

R = 0;
for s = 0:((n-abs(l))/2)
    R = R + (((-1)^s)*factorial(n-s))/(factorial(s)*factorial((0.5*(n+abs(l))-s))*factorial((0.5*(n-abs(l))-s)))*(rho.^(n-2*s));
end

if l >=0
    Z = N.*R.*cos(l*theta);
else %if l<0
    Z = -N.*R.*sin(l*theta);
end

out = Z;