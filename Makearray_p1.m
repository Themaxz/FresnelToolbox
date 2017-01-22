function M=Makearray_p1(f,lens_diameter_p,dx,resolution,lambda)
%Makearray(f,lens_diameter_p,array_size,resolution,lambda)
%makes a square grid arrangement microlens array Diameter of le lenslet is
%defined by lens_diameter_p in pixel e.g. if the microlens should sample 10
% values of directional coordinates, this parameter should be 10. hte
% number of microlens depends from this parameter and the total resolution.


res=dx;
range=lens_diameter_p.*res;
radius=lens_diameter_p./2.*res;

array_size=dx.*resolution;
Z=Makelenslet(f,range,radius,lens_diameter_p,lambda);
grid=Makegrid_square(array_size,resolution,radius);
G=conv2(Z,grid.field);
grid.field=G(1:resolution(1),1:resolution(2));
M=grid;
M.focus=f;
M.lambda=lambda;
M.lens_diameter=range;
M.res=res;
M.pixel=lens_diameter_p;
M.w=array_size;
M.NA=range./f;

