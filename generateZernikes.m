function [Zernike, ZernikeDerivX, ZernikeDerivY, ZernikeCurv] = generateZernikes(radial_min, radial_max, Coords, Zernikesonly, display_plot)
% Generates series of Zernikes, from radial order radial_min 
% up to radial order radial_max, together with their
% derivatives in the x- and y-directions and the curvature (Laplacian)
% Zernikesonly = 1 generates only the Zernike terms and not derivatives
% display_plot = 1 displays the plots in a table
%
% Usage:    [Zernike, ZernikeDerivX, ZernikeDerivY, ZernikeCurv] = generateZernikes(radial_min, radial_max, [Radius size], 0, 1)
%   generates Derivatives and Curvatures over a pupil of
%   radius 'Radius', given as a fraction of one (w.r.t. the matrix size. i.e.
%   the pupil output will be defined as a unit pupil as required by the
%   definition of the Zernike polynomials)
%
% Or:       Zernike = generateZernikes(radial_min, radial_max);
%   generates only Zernikes over default values
% 
% Or:       Zernike = generateZernikes(radial_min, radial_max, [Radius centre size]);
%
% S Gruppetta 10/2004

warning off

global Zernike

if ~exist('Coords')
    %if ~exist('Coords(2)')
    %    M_size = 128;
    %end
    Radius=1;
else
    Radius = Coords(1);
    %if exist('Coords(2)')
        M_size = Coords(2);
    %else
    %    M_size = 128;
    %end
end

if ~exist('Zernikesonly')
    Zernikesonly=1;
end

if ~exist('display_plot')
    display_plot=1;
end

sizex=Radius*M_size;
sizey=sizex;
DX = 2/sizex;
DY = 2/sizey;
[x_coords,y_coords] = meshgrid((-sizex/2+1)*DX : DX : (sizex/2)*DX, (-sizey/2+1)*DY : DY : (sizey/2)*DY);

pupil = (x_coords.^2 + y_coords.^2 <= 1);

pad = M_size*(1 - Radius)/2;

% generate piston separately and place at end of cell
% array (since zero-index not allowed)
Zernike{zernike_index_conversion(radial_max,radial_max)+1} = zeros(M_size,M_size);
Zernike{zernike_index_conversion(radial_max,radial_max)+1}((pad+1):M_size-pad,(pad+1):M_size-pad) = zernikexy(0, 0, x_coords, y_coords, 'N').*pupil;
if (radial_min == 0)   % piston is always generated in any case and 0 index not allowed below
	radial_min = 1;
end

if (display_plot == 1) figure; end
for n = radial_min:radial_max
    l_max=n;    
    for l = -l_max :2: l_max
        index = zernike_index_conversion(n,l);
        Zernike{index} = zeros(M_size,M_size);
        Zernike{index}((pad+1):M_size-pad,(pad+1):M_size-pad) = zernikexy(n, l, x_coords, y_coords, 'N').*pupil;
        if (display_plot == 1)
            temp(:,:) = Zernike{index};
            subplot(radial_max, 2*radial_max+1, (2*radial_max+1)*(n-1)+(radial_max+1+l)); imagesc(temp);axis image;axis off
        end        
    end
end

% if Zernikesonly zero, then calculate x- and y-derivatives of Zernikes
if (Zernikesonly > 0)
    return
end

if (display_plot == 1) figure; end
for n = radial_min:radial_max
    l_max=n;
    for l = -l_max :2: l_max
        ZernikeDerivX{zernike_index_conversion(n,l)} = zeros(M_size,M_size);
        ZernikeDerivX{zernike_index_conversion(n,l)}((pad+1):M_size-pad,(pad+1):M_size-pad) = zernikexy_diff(n, l, x_coords, y_coords, 'x', 'N').*pupil;
        if (display_plot == 1)
            temp(:,:) = ZernikeDerivX{zernike_index_conversion(n,l)};
            subplot(radial_max, 2*radial_max+1, (2*radial_max+1)*(n-1)+(radial_max+1+l)), imagesc(temp);axis image;axis off
        end
        
    end
end
if (display_plot == 1) figure; end;
for n = radial_min:radial_max
    l_max=n;
    for l = -l_max :2: l_max
        ZernikeDerivY{zernike_index_conversion(n,l)} = zeros(M_size,M_size);
        ZernikeDerivY{zernike_index_conversion(n,l)}((pad+1):M_size-pad,(pad+1):M_size-pad) = zernikexy_diff(n, l, x_coords, y_coords, 'y', 'N').*pupil;
        if (display_plot == 1)
            temp(:,:) = ZernikeDerivY{zernike_index_conversion(n,l)};
            subplot(radial_max, 2*radial_max+1, (2*radial_max+1)*(n-1)+(radial_max+1+l)), imagesc(temp);axis image;axis off
        end
        
    end
end

% if Zernikesonly zero, then calculate the curvature of the Zernikes
if (Zernikesonly > 0)
    return
end
clear temp
pupil_curv(:,:) = Zernike{zernike_index_conversion(radial_min,radial_min)}~=0;
pupil_curv = Reduce(Pack(pupil_curv,2),3);
if (display_plot == 1) figure; end
	for n = radial_min:radial_max
        l_max=n;
        for l = -l_max :2: l_max
            temp(:,:) = Zernike{zernike_index_conversion(n,l)};
            ZernikeCurv{zernike_index_conversion(n,l)} = del2(temp,DX,DY);
            if (display_plot == 1)
                temp(:,:) = ZernikeCurv{zernike_index_conversion(n,l)};
                subplot(radial_max, 2*radial_max+1, (2*radial_max+1)*(n-1)+(radial_max+1+l)), imagesc(temp.*pupil_curv);axis image;axis off
            end            
        end
	end
    
warning on