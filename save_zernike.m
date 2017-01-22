for index=1:6
% clear all
close all

scaling=0.5;
% index=3;
pix=100;
numlenslet=35;
h=10;
w=.5e-3;
res=numlenslet.*pix;
dx=w./res;
cd('C:\Users\Massimo\Documents\MATLAB\ECBO\plane wave\');
NL=[1 -1;1 1; 2 -2; 2 2; 3 -1; 3 1];
nl=NL(index,:);
   n=nl(1);
   m=nl(2);

x=[-w./2:dx:w./2];

Z=1e-7.*Zernike(n,m,3499);
figure, imagesc(x,x,Z), colorbar;
axis square;


   

%     export_fig (strcat('ZERNIn = ',num2str(n),'  m = ',num2str(m)),'-pdf','-transparent');
     export_fig (strcat('n1 = ',num2str(n),'  m = ',num2str(m)),'-pdf','-transparent');
    k=k+1;

end