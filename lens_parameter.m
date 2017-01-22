function OUT=lens_parameter(f,dx,lambda,aperture)
w=aperture;
OUT.max_aperture=(lambda.*f)./(4.*pi.*dx);
OUT.min_focal=(4.*pi.*w.*dx)./(lambda);
OUT.min_res=(4.*pi.*(w^2))./(lambda.*f);
