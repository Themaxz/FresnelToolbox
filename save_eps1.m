clear all
scaling=.2;
index=1;
pix=100;
numlenslet=35;
% h=3;




cd('C:\Users\Massimo\Documents\MATLAB\ECBO\plane wave\');
NL=[1 -1;1 1; 2 -2; 2 0; 2 2; 3 -3; 3 -1; 3 1; 3 3];
nl=NL(index,:);
   n=nl(1);
   m=nl(2);
% load(strcat('shift',num2str(n),num2str(m),'.mat'));
load('C:\Users\Massimo\Documents\MATLAB\ECBO\plane wave\PW_ab11_0.mat')
dx=P.dxi;
v=[pix./2:pix:(numlenslet*pix)];
pitch=pix.*dx;
v=v.*dx;
tick=[v(1)-(pitch./2):pitch:v(end)-(pitch./2)];

[Vx,Vy]=meshgrid(v,v);
% in=v(18-h);
% su=v(18+h);
% tick=tick(1,18-h:18+h);
% Vx=Vx.*dx;
% Vy=Vy.*dx;
% k=1;

%     MX=PIX_X.*dx;
%     MY=PIX_Y.*dx;
%     my=MY(:,:,k);
%     mx=MX(:,:,k);
%     figure, quiver(Vx,Vy,mx,my,scaling);
%     axis([in, su,in,su]);
figure, imagesc(raw_ab);
    axis square;
    colormap gray;
    
    tit=strcat('Raw Image n = ',num2str(n),'  m = ',num2str(m));
    title(tit);
    ax=gca;
    set(ax,'XTick',tick,'YTick',tick);
    grid on
    export_fig ('RAW ','-png','-transparent');
%     k=k+1;

    