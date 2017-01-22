function r=PlotMax(P,zeta_max,int)
% r=PlotMax(P,zeta_max,int)
dz=zeta_max./int;
y=zeros(1,int);
x=0:dz:zeta_max;
s=max(size(P.field));
zmin=1.5e-3;
z=zmin;
%z=0;
a=0;
for k=1:int+1
    z=z+dz;
    U=FresnelI(P,z,500);
    y(1,k)=abs(U.field(round(s./2),round(s./2)));
    %y(1,k)=abs(U.field(501,501));
    for l=1:s
%         for m=1:s
%             a=a+abs(U.field(l,m));
%         end
    end
    %y(1,k)=abs(max(max(U.field)));
end
%keyboard
%y=y./a;
figure, plot(x,y);
r=y;
    
    