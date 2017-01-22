function makeZernikeTriangle(radial_min,radial_max,sampling)
%
% Plots the Zernike triangle using the OSA standard ordering and
% nomenclature for radial orders radial_min to radial_max with the required
% sampling (default = 100)
%
% Usage: makeZernikeTriangle(radial_min,radial_max,sampling)
%
% Uses Z.m
%
% S Gruppetta 02/2008

if ~exist('sampling')
    sampling = 200;
end
sampling = round(sampling/10)*10;

x = -1:2/sampling:1;
[X,Y] = meshgrid(x,x);
[th,rho] = cart2pol(X,Y);

mask = rho<1;
figure;

for n = radial_min:radial_max
    l_max=n;
    for l = -l_max :2: l_max

            temp(:,:) = Z(n,l,rho,th).*mask;
            %subplot(radial_max, 2*radial_max+1, (2*radial_max+1)*(n-1)+(radial_max+1+l)), imagesc(temp);axis image;axis off;title(strcat('Z_{',num2str(n),'}^{',num2str(l),'}'),'FontSize',20)
            subplot(radial_max, 2*radial_max+1, (2*radial_max+1)*(n-1)+(radial_max+1+l)), imagesc(temp);axis image;axis off;%title(strcat('Z_{',num2str(n),'}^{',num2str(l),'}'),'FontSize',20)
        
        
    end
end