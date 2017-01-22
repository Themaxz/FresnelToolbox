function [v z]=minumum_depth(dx,a,b,r,z1,z2,f_micro,f)
%v=minumum_depth(dx,b,r)
%compute the minimum resolvable depth given the pixel size dx, the
%distance between the microlens and the sensor b and the microlens radius f
v=(dx.*b)./(r-dx);
z_micro=((f_micro.*b)+(f_micro.*v)-(a.*b)-(v.*a)+(f_micro.*a))./(f_micro-v-b);
%z_=(-(a.*b)+(fmicro.*b)+(fmicro.*a)+(v.*fmicro)+(v.*a))./(fmicro-b-v);
z=((f.*z2)+(f.*z_micro)-(z1.*z2)-(z_micro.*z1)+(f.*z1))./(f-z2-z_micro);


