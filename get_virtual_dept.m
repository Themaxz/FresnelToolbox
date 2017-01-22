function v=get_virtual_dept(x,f,a,b,fmicro)
%virtual depth for a 2f plenoptic system
x1=(f.*x)./(3*f-x); %position of the main lens image
v=(fmicro.*(b+a-x1)-b.*(a-x1))./(x1-f-a);%virtual depth corresponding to the depth step x
