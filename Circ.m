function circ=Circ(fx,fy,lambda,pixel,range)
r=sqrt(fx.^2+fy.^2)./lambda;
[xi,XI,ETA,dxi]=Objectplane(range,pixel); %creates xi,eta and return pixel dim
u1=XI.^2+ETA.^2<=r.^2; %creates Pupil 
figure, imagesc(xi,xi,u1),axis square;