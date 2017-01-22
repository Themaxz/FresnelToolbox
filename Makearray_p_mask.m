function MASK=Makearray_p_mask(f,lens_diameter_p,array_size,resolution,lambda,b,z1)
%Makearray(f,lens_diameter_p,array_size,resolution,lambda)
%makes a square grid arrangement microlens array Diameter of le lenslet is
%defined by lens_diameter_p in pixel e.g. if the microlens should sample 10
% values of directional coordinates, this parameter should be 10. hte
% number of microlens depends from this parameter and the total resolution.


res=array_size./resolution;
range=lens_diameter_p.*res;
radius=lens_diameter_p./2.*res;
if max(size(res))~=1
    radius=radius(1);
end
if max(size(resolution))==1
    resolution=[resolution resolution];
end


Z=Makelenslet(f,range,radius,lens_diameter_p,lambda);
pix=lens_diameter_p;
res=max(resolution);

[Z1,~,center]=dist_grid(res,pix,b,z1);
G=conv2(Z,Z1);
MASK=abs(G(1:resolution(1),1:resolution(2)));


