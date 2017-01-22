function G=Gauss(size,sigma)
% make a gaussian filter for image processing
gauss=fspecial('gaussian',size,sigma);
gauss=gauss./max(max(gauss));
m=round(size./2);
gauss(m-3:m+3,:)=1;
gauss(:,m-3:m+3)=1;
G=gauss;