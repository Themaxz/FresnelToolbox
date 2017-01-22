function [c2ast, c20, c00] = convertAstig2Zernikes(zo, za, r)

% [c2ast, c20, c00] = convertAstig2Zernikes(zo, za, r)
%
% convertAstig2Zernikes converts an astigmatism stated in terms of the axial
% seperation between the focal planes (along the meridian containing astigmatism) 
% into appropriate Zernike terms matching that level of defocus.
%
% INPUTS:
%   zo = axial distance of focal plane from optical system (principal plane) (in m)
%   za = axial distance of defocused plane along astigmatism meridian from optical system (in m)
%   r  = pupil radius (in m)
%
% OUTPUT:
%   c2ast = coefficient of either Z(2,2) or Z(2,-2)
%   c20   = coefficient of Z(2,0)
%   c00   = coefficient of Z(2,0)
%
%   (Labbook reference page 122, 11/06/2013)
%   
%
%   Required astigmatism term can therefore be given by (c2ast.*Zernike(2,2,sampling) + c20.*Zernike(2,0,sampling) + c00.*Zernike(0,0,sampling))   
%   or equivalently using Zernike(2,-2,sampling)
%
%
% S. Gruppetta, 03/2013

c2ast = r^2*(1/zo - 1/za)/(4*sqrt(6));
c20 = r^2*(1/zo - 1/za)/(8*sqrt(3));
c00 = r^2*(1/zo - 1/za)/(8);