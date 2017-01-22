function out = Zernike(n,l,sampling)
%
% Creates Zernike polynomial with order (n,l) with the desired sampling -
% to create Zernike polynomials efficiently see Z.m in which the required
% variables are created only once at the start
%
% Usage:    A = Zernike(n,l);
% Or:       A = Zernike(n,l,sampling);
% where n is the radial order and l the azimuthal order required. The
% optional sampling parameter determines the size of the square matrix
% required (default = 200)
% 
% Uses Z.m
%
% S. Gruppetta 02/2008

if ~exist('sampling')
    sampling = 200;
end
%sampling = round(sampling/10)*10;

x = -1:2/sampling:1;
[X,Y] = meshgrid(x,x);
[th,rho] = cart2pol(X,Y);

mask = rho<1;

out = Z(n,l,rho,th).*mask;