function M=Makearray(f,lens_diameter,array_size,resolution,lambda)
%Makearray(f,lens_diameter,array_size,resolution,lambda)
%makes a square grid arrangement microlens array 
ratio=round(array_size./lens_diameter);
radius=lens_diameter./2;
pixel=round(resolution./ratio);
range=lens_diameter;

Z=Makelenslet(f,range,radius,pixel,lambda);
grid=Makegrid(array_size,resolution,radius);
G=conv2(Z,grid.field);
grid.field=G(1:resolution+1,1:resolution+1);
M=grid;
M.focus=f;
M.lambda=lambda;
