num_points = 5;
iter = 300;
pix = 30;
res = 101.*pix;
img = imread('C:\Users\Massimo\Documents\MATLAB\text.png');
img = rgb2gray(img);
img = im2double(img);
% figure, imagesc(img);
img = img(1:280,1:560);
w = 1.5e-2;
%r = [1e-5 1e-5];
% OS = linspace(-3e-3,3e-3,num_points);
OS = [0 0 0 0 0];
img = imresize(img,res./560);
% dz = linspace(-1e-4,0,num_points);
% dz = -0.007;
%dz = linspace(50e-2,0,5);
%dz = [25e-2,12.5e-2,0];
%dz = 0;
M  = Makearray_p(1e-2,pix,w,res,633);
fmicro = 10e-3;
f_num = fmicro./(M.lens_diameter);
z = 240e-3;
% dz1 = M.lens_diameter./(tan(M.NA./2));
% 
% z1 = z-dz1;
% z2 = LensLaw(60e-3,z1);
% dzeta = z2-z;
dzeta = 0.025;
dz = [-dzeta.*2,-dzeta,0, dzeta, 2.*dzeta];
radius = (z)./(2.*f_num);

L = Makelens(z./2,w,radius,res,633);
raw = zeros(res);
% n = num_points;
%dz = 10e-6;
n = size(dz,2);
P = Makepupil(w,res,1e-5);
X = linspace(-w./2,w./2,sqrt(M.num_lenslet));
Q = linspace(-M.NA./2,M.NA./2,sqrt(M.num_lenslet));
    image = cell(:,:,3);
    RAW = cell(:,:,3);
    E = cell(:,:,5);
    E1 = E;
    LF = cell(:,:,:,:,5);
    z_a  = LensLaw(L.focal,z+dz);
 alpha = z./z_a;
 IMG = cell(:,:,5);
 IMG1 = IMG;
 buffer = zeros(res);
 b = zeros(res);
for i = 1:n
    if dz == 0
        buffer(end./2:end,:) = img;
    else
        buffer(1:end./2,:) = img;
    end
 %  P = Makepupil(w,res,r);
     for i = 1:iter
         Y = randphase_sources(250,res);
         P.field = buffer.*Y;
        P1 = AngularBL_test(P,z+(dz(i)),633);
        P2 = throughlens(P1,L,633);
        P3 = AngularBL_test(P2,z,633);
        image{i} = abs(P3.field);
        P3.field = P3.field.*M.field;
        P4 = AngularBL_test(P3,fmicro,633);
        b = b+ abs(P4.field);
    %     raw = raw+abs(b./max(b(:)));%./max(b(:)));
        display(strcat('incoherent iter: ',num2str(i)));
     end
  	raw = abs (b./max(b(:)));
    RAW{i} = raw;
%     for h=1:res
%         for j = 1:res
%             if raw(h,j)<0.1
%                 raw(h,j) = 0;
%             end
%         end
%     end
    
    display(strcat('iteration: ',num2str(i)))
    
%     [S,LF] = LightField(raw,sqrt(M.num_lenslet));
%     
%     E{i} = Epipolar(LF,51,15,'tv');
%     IMG{i} = integIMG(LF);
%     
%     
%     figure, imagesc(X,X,IMG{i}),map;
%     title(strcat('Rendered Image. Defocus: ',num2str(dz(i))));
%      xlabel('Position (m)');
%     ylabel('Position (m)');
%     export_fig(strcat('rendered',num2str(dz(i)),'.eps'),'-eps','-transparent');
%     
%     
%     figure, imagesc(X,Q,E{i}'), axis equal;
%     xlabel('Position (m)');
%     ylabel('Direction (rad)');   
%     title(strcat('Phase space. Defocus = ',num2str(dz(i)),' '));
%     export_fig(strcat('phasespace',num2str(dz(i)),'.eps'),'-eps','-transparent');
%     
% 
% 
%     LF1 = shear_a(LF,alpha(i));
%     IMG1{i} = integIMG(LF1);
%     E1{i} = Epipolar(LF1,51,15,'tv');
%     
%     
%     figure, imagesc(X,X,IMG1{i}),map;
%     title(strcat('Rendered Image refocused. Defocus: ',num2str(dz(i))));
%      xlabel('Position (m)');
%     ylabel('Position (m)');
%     export_fig(strcat('refocusrendered',num2str(dz(i)),'.eps'),'-eps','-transparent');
%     
%     
%     figure, imagesc(X,Q,E1{i}'), axis equal;
%     xlabel('Position (m)');
%     ylabel('Direction (rad)');   
%     title(strcat('Phase space refocused. Defocus = ',num2str(dz(i)),' '));
%     export_fig(strcat('refocusphasespace',num2str(dz(i)),'.eps'),'-eps','-transparent');
%     
% %     figure, imagesc(X,Q,E'),map;
% %     xlabel('Position (m)');
% %     ylabel('Direction (rad)');   
% %     title(strcat('Phase space. Defocus = ',num2str(dz(i)),' '));
% %     export_fig(strcat('phasespace',num2str(dz(i)),'.eps'),'-eps','-transparent');
% %     
% %     %figure, imagesc(raw(end./2-250:end./2+250,end./2-250:end./2+250)),map;
% %      figure, imagesc(raw),map;
% %     set(gca,'xticklabel',[])    
% %     set(gca,'yticklabel',[])    
% %     title(strcat('Raw image. Defocus = ',num2str(dz(i)),' '));
% %     export_fig(strcat('rawimage',num2str(dz(i)),'.eps'),'-eps','-transparent');
% %     
% %     IMG = integIMG(LF);
% %     figure, imagesc(X,X,IMG),map;
% %     xlabel('Position (m)');
% %     ylabel('Position (m)');
% %     title(strcat('Raw image. Defocus = ',num2str(dz(i)),' '));
% %     export_fig(strcat('render',num2str(dz(i)),'.eps'),'-eps','-transparent');
% %     
% %     
% %     prof = sum(IMG);
% %     c = find(prof > max(prof)./2);
% %     FWHM = abs(X(c(1)))+abs(X(c(end)));
% %     figure, plot(X,sum(IMG),'r');
% %     xlabel('Position (m)');
% %     ylabel('Intensity (a.u.)');
% %     title(strcat('Defocus = ',num2str(dz(i)),' '));
% %     figure(4)
% %     hold on
% %     line([X(c(1)),X(c(1))],ylim);
%    % line([X(c(end)),X(c(end))],ylim);
%     
%    % export_fig(strcat('profile',num2str(dz(i)),'.eps'),'-eps','-transparent');
%   %  close all
  
 end
% raw = (RAW{1}./max(max(RAW{1})))+(RAW{2}./max(max(RAW{2})))+(RAW{3}./max(max(RAW{3})))+(RAW{5}./max(max(RAW{5})))+(RAW{4}./max(max(RAW{4})));
% [S,LF] = LightField(raw, sqrt(M.num_lenslet));
airydisk = 1.22.* 633e-9./M.NA;
% z_a  = LensLaw(L.focal,z+dz);
% alpha = z./z_a;
% IMG = cell(:,:,5);
% for i = 1:5
% IMG{i} = integIMG(shear_a(LF,alpha(i)));
% end
%phasespace;
% LFI = cell(:,:,20);
% E = cell(:,:,20);
% for i = 1:20
%     LFI{i} = shear(LF,i);
%         E{i} = Epipolar(LFI{i},51,10,'tv');
% 
%     figure, imagesc(X,Q,E{i}');
%     figure, imagesc(integIMG(LFI{i}));
% end
% for  i=1:4000
% for j = 1:4000
% if(raw(i,j)<=0.45)
% raw(i,j) = 0;
% end
% end
% end
%[S,L] = LightField(raw,sqrt(M.num_lenslet));
% I = cell(:,:,20);
% E = cell(:,:,20);
% k = 1;
% for i = -10:10
%     L1 = shear(L,i);
%     I{k} = integIMG(L1);
%     E{k} = Epipolar(L1,100,10,'tv');
%     k = k+1;
%     display(i);
% end

