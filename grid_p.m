function M=grid_p(source_diameter,array_size,resolution,dist_pix)
%Makearray(f,lens_diameter_p,array_size,resolution,lambda)
%makes a square grid arrangement microlens array Diameter of le lenslet is
%defined by lens_diameter_p in pixel e.g. if the microlens should sample 10
% values of directional coordinates, this parameter should be 10. hte
% number of microlens depends from this parameter and the total resolution.


res=array_size./resolution;
source_diameter_p=source_diameter./res;
range=source_diameter_p.*res;
radius=source_diameter./2;
if max(size(res))~=1
    radius=radius(1);
end
if max(size(resolution))==1
    resolution=[resolution resolution];
end

radius2=(dist_pix./2).*res;
P=Makepupil(range,source_diameter_p,radius);
P.field=double(P.field);
grid=Makegrid_square(array_size,resolution,radius2);
G=conv2(P.field,grid.field);
grid.field=G(1:resolution(1),1:resolution(2));
M=grid.field;



