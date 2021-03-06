function MASK=Makearray_p_mask_r(f,lens_diameter_p,array_size,resolution,lambda,b,z1)
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
% res=max(resolution);

[Z1,grid,center]=dist_grid_rect(resolution-pix+1,pix,b,z1); %#ok<ASGLU,NASGU>
G=conv2(Z,Z1);
s1=size(G);
s2=size(Z1);
offs=s1-s2;
MASK=abs(G);


