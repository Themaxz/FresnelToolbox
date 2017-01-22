function Y=lenslet(f,lambda,diameter,dim,pixel)

[xi,XI,ETA,dxi]=Objectplane(dim,pixel);
lambda=lambda.*1e-9;
xc=zeros(1,pixel+1);
mark=round(diameter./dxi);
%num=pixel./mark;
for k=1:mark:pixel
    %if k==num+(k-1)
        xc(1,k)=k;
        %k
    %end
end

yi=xi';
yc=xc';
%keyboard

[XC,YC]=meshgrid(xc);
A=exp(((-2.*pi)./lambda).*((XI-100).^2+(ETA-100).^2));
keyboard
Y=A;

