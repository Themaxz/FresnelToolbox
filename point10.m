num_points = 2;
pix = 30;
res = 101.*pix;
w = 1.5e-2;
r = [5e-6 5e-6];
 OS = linspace(-2e-3,2e-3,num_points);
%OS = [0 0 0 0 0];

 dz = linspace(-5e-2,5e-2,num_points);
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
%dzeta = 0.05;
%dz = [-dzeta.*2,-dzeta,0, dzeta, 2.*dzeta];
%dz = [-dzeta,-dzeta./2, 0,dzeta./2, dzeta];
radius = (z)./(2.*f_num);

L = Makelens(z./2,w,radius,res,633);
raw = zeros(res);
% n = num_points;
%dz = 10e-6;
n = size(dz,2);
P = Makepupil(w,res,5e-5);
X = linspace(-w./2,w./2,sqrt(M.num_lenslet));
Q = linspace(-M.NA./2,M.NA./2,sqrt(M.num_lenslet));
    image = cell(:,:,num_points);
    RAW = cell(:,:,num_points);
    E = cell(:,:,num_points);
    %LF = cell(:,:,:,:,num_points);
    z_a  = LensLaw(L.focal,z+dz);
 alpha = z./z_a;
 IMG = cell(:,:,num_points);
for i = 1:num_points
    
    buffer = Makepupil_OS(w,res,r,[OS(i) OS(i)]);
 %  P = Makepupil(w,res,r);
     P.field = buffer;
    P1 = AngularBL(P,z+(dz(i)),633);
    P2 = throughlens(P1,L,633);
    P3 = AngularBL(P2,z,633);
    image{i} = abs(P3.field);
    P3.field = P3.field.*M.field;
    P4 = AngularBL(P3,fmicro,633);
    b = abs(P4.field);
   %   raw = raw+abs(b./sum(b(:)));%./max(b(:)));
      
     RAW{i} = abs (b./sum(b(:)));
%     for h=1:res
%         for j = 1:res
%             if raw(h,j)<0.1
%                 raw(h,j) = 0;
%             end
%         end
%     end
   
    display(strcat('iteration: ',num2str(i)))
    
    [S,LF] = LightField(raw,sqrt(M.num_lenslet));
    
    E{i} = Epipolar(LF,51,15,'tv');
    IMG{i} = integIMG(LF);
    
    
%     figure, imagesc(X,Q,E'),map;
%     xlabel('Position (m)');
%     ylabel('Direction (rad)');   
%     title(strcat('Phase space. Defocus = ',num2str(dz(i)),' '));
%     export_fig(strcat('phasespace',num2str(dz(i)),'.eps'),'-eps','-transparent');
%     
%     %figure, imagesc(raw(end./2-250:end./2+250,end./2-250:end./2+250)),map;
%      figure, imagesc(raw),map;
%     set(gca,'xticklabel',[])    
%     set(gca,'yticklabel',[])    
%     title(strcat('Raw image. Defocus = ',num2str(dz(i)),' '));
%     export_fig(strcat('rawimage',num2str(dz(i)),'.eps'),'-eps','-transparent');
%     
%     IMG = integIMG(LF);
%     figure, imagesc(X,X,IMG),map;
%     xlabel('Position (m)');
%     ylabel('Position (m)');
%     title(strcat('Raw image. Defocus = ',num2str(dz(i)),' '));
%     export_fig(strcat('render',num2str(dz(i)),'.eps'),'-eps','-transparent');
%     
%     
%     prof = sum(IMG);
%     c = find(prof > max(prof)./2);
%     FWHM = abs(X(c(1)))+abs(X(c(end)));
%     figure, plot(X,sum(IMG),'r');
%     xlabel('Position (m)');
%     ylabel('Intensity (a.u.)');
%     title(strcat('Defocus = ',num2str(dz(i)),' '));
%     figure(4)
%     hold on
%     line([X(c(1)),X(c(1))],ylim);
   % line([X(c(end)),X(c(end))],ylim);
    
   % export_fig(strcat('profile',num2str(dz(i)),'.eps'),'-eps','-transparent');
  %  close all
  
 end
% raw = (RAW{1}./max(max(RAW{1})))+(RAW{2}./max(max(RAW{2})))+(RAW{3}./max(max(RAW{3})))+(RAW{5}./max(max(RAW{5})))+(RAW{4}./max(max(RAW{4})));
% raw = RAW{1}./sum(RAW{1}(:))+RAW{2}./sum(RAW{2}(:))+RAW{3}./sum(RAW{3}(:));
% [S,LF] = LightField(raw, sqrt(M.num_lenslet));
airydisk = 1.22.* 633e-9./M.NA;
z_a  = LensLaw(L.focal,z+dz);
alpha = z./z_a;
IMG = cell(:,:,num_points);
for i = 1:num_points
IMG1{i} = integIMG(shear_a(LF,alpha(i)));
end
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

