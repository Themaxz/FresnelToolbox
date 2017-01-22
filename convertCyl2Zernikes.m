function [c2ast, c20, c00] = convertCyl2Zernikes(zo, K, r, n)

% [c20, c00] = convertCyl2Zernikes(zo, K, r)
%
% convertCyl2Zernikes converts an astigmatism stated in terms of the
% cylinder term in Diopters (refractive error K) and the image distance into appropriate Zernike terms
% matching that level of defocus.
%
% INPUTS:
%   zo = axial distance of focal plane from optical system (principal plane) (in m)
%   K  = astigmatism (cyl term) in Diopters (in D)
%   r  = pupil radius (in m)
%   n  = refractive index of image space (1.336 for vitreous is default)
%
% OUTPUT:
%   c2ast = coefficient of either Z(2,2) or Z(2,-2)
%   c20   = coefficient of Z(2,0)
%   c00   = coefficient of Z(2,0)
%
%   (Labbook reference page 122 & pp. 119-120 11/06/2013)
%   See convertAstig2Zernikes for main maths. This function simply
%   converts the cylinder term in Diopters to the distance of the defocussed
%   plane along the appropriate meridian from the optical system, za, which is then used in
%   convertAstig2Zernikes.
%
%   Since K' = K + F
%       n'/zd = K + n'/zo
%   rearranging gives:
%       zd = n'.zo/(K.zo+n')
%
%   Required astigmatism  term can therefore be given by (c20.*Zernike(2,0,sampling) + c00.*Zernike(0,0,sampling))   
%
%
% S. Gruppetta, 06/2013

if ~exist('n')
    n=1.336;
end

za = n*zo./(K.*zo+n);

[c2ast, c20, c00] = convertAstig2Zernikes(zo, za, r);