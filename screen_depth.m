function dz=screen_depth(angle,FoV)
angle=angle.*pi./180;
dz=tan(angle).*FoV;
