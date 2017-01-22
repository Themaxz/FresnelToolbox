function Rc=radius_curv(h,D)
%gives the radius of curvature of a lenslet with sag h and aperture D

Rc=((h.^2)+((D.^2)./4)./(2.*h));