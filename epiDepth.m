function depth = epiDepth(I,f,thresh)
% Calculate depth from image based on the distance between planes (aperture
% and sensor) and the threshold value for the image.

threshedI = I > thresh;
% figure, imshow(threshedI,[])
stats = regionprops(threshedI,'all');
areas = cat(1, stats.Area);
[~,v] = max(areas);
deltaX = range(stats(v).PixelList(:,1))
toFill = stats(v).Image;
filled = imfill(toFill,'holes');
deltaS = mean(sum(filled(:,3:end-2)))
% figure, imshow(stats(v).Image,[]);
% figure, imshow(filled,[]);
depth = -f*deltaS/deltaX;