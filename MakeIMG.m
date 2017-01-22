function IMG=MakeIMG(img,range)

% IMG=MakeIMG(img,range)
% takes the image file img and converts it into a struc suitabl for Fresnel propagation toolbox
type=class(img);
s=strcmp(type,'uint8');
if s==1
    I=rgb2gray(img);
    img=im2double(I); %convert the image into double
end
M=max(size(img));  
img1=img./max(max(img));
pixel=M-1;
dim=range;
[xi,XI,ETA,dxi]=Objectplane(dim,pixel); %creates the object plane of the size of the image

%define output structure
IMG.field=img1;
IMG.xi=xi;

IMG.DXI=range;
IMG.dxi=dxi;