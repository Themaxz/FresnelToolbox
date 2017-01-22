function gauss=Gauss2(size,sigma)
% make a gaussian filter for image processing
gauss=fspecial('gaussian',size,sigma);
gauss=gauss./max(max(gauss));
