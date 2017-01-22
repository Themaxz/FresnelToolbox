function A = Zern(n,l)
% Outputs Zernike polnomial Z_nl - requires function generateZernikes to be
% run beforehand

Zernike=evalin('caller','Zernike;'); % calls variable Zernike from workspace, created by function generateZernikes

if (n==0)
    A(:,:) = Zernike{length(Zernike)};
else
	A(:,:) = Zernike{zernike_index_conversion(n,l)};
end