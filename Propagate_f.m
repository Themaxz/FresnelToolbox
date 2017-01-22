function [U]=Propagate_f(P,zeta,lambda,sigma)

%U=Propagate_f(P,zeta,lambda,sigma)
% Propagates the field P for a distance zeta at a wavelenght lambda in an iterative mode.
%It also performs a gaussian filter. Sigma is a parameter between 0 and 1
%and represent the % of pixel that i want the gaussian filter to be wide
%e.g. U=Propagate_f(P,10e-2,633,0.1) propagate the object P foe 10cm at a
%wavelenght of 633nm. If the dimention of the object field is 1000 pixels
%the gaussian filter will have a central lobe 0.1*1000=100 pixels wide

z=getzeta(P,lambda); %calculates the propagation distance in order to keep the same resolution with 0 padding

i=zeta./z;

i=round(i);
p=zeros(max(size(P.field)),i);
% sigma=0.01;
U1=Fresnelr(P,z,lambda); %first step
p(:,1)=getprofile(U1);
p(:,1)=p(:,1)./max(max(p(:,1)));
s=max(size(U1.field));
for j=1:i-1 %iterative propagation in i steps

    U1=Fresnelr(U1,z,lambda);
    U1.field=U1.field./max(max(U1.field));
    p(:,j)=getprofile(U1);
    %filtering section
    if mod(j,5)==0;
        I=abs(U1.field);
        fI=ft0(I);
    
        filter=fspecial('gaussian', s,sigma.*s);
    
        fI1=fI.*filter;
        I1=ift0(fI1);
        U1.field=I1;
    end

end

% I=abs(U1.field);
% fI=ft0(I);
% 
% filter=fspecial('gaussian', s,sigma.*s);
% 
% fI1=fI.*filter;
% I1=ift0(fI1);
% U1.field=I1;
figure, subplot(1,2,1), imagesc(P.xi,P.xi,abs(P.field)), axis square, subplot(1,2,2),imagesc(U1.xi,U1.xi,abs(U1.field)), axis square;
U=U1;
U.p=p;




    
