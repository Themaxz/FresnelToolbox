function [v dz volume]=minimum_depth(dx,a,b,r_micro,a_lens,b_lens,fmicro,f_lens)
%v=minumum_depth(dx,b,r)
%compute the minimum resolvable depth given the pixel size dx, the
%distance between the microlens and the sensor b and the microlens radius f
v=(dx.*b)./(r_micro-dx);
% z1=((-a.*b)+(fmicro.*b)+(fmicro.*a)+(v.*(fmicro-a)))/(fmicro-b-v);
% z=-((-d1.*d2)+(f.*d2)+(f.*d1)+(z1.*(f-d1)))/(f-d2-z1);

z1=((fmicro.*b)+(fmicro.*v)-(a.*b)-(v.*a)+(fmicro.*a))./(fmicro-v-b);
dz=((f_lens.*a_lens)+(f_lens.*z1)-(a_lens.*b_lens)-(z1.*a_lens)+(f_lens.*a_lens))./(f_lens-z1-b_lens);
numDepth = r_micro./dx; %number focal planes
volume = numDepth.*dz;
m = b_lens./a_lens;
figure, plot(m,dz), title('resolution vs magnification');