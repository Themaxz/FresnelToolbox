function v=minumum_depth(dx,b,r)
%v=minumum_virtual_depth(dx,b,r)
%compute the minimum resolvable virtual depth given the pixel size dx, the
%distance between the microlens and the sensor b and the microlens radius f
v=(dx.*b)./(r-dx);
