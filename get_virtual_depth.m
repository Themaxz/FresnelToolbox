function [v, z]=get_virtual_depth(x,f,a,b,fmicro)
%virtual depth for a 2f plenoptic system
x1=(f.*x)./(3*f-x); %position of the main lens image
v=(fmicro.*(b+a-x1)-b.*(a-x1))./(x1-fmicro-a);%virtual depth corresponding to the depth step x
z=-((a.*b)+(f.*b)+(f.*a)+(v.*f)-(v.*a))/(f-b-v);