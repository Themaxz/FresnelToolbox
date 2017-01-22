for i=1:frames
figure, imagesc(FS(:,:,i)), colormap gray;
% caxis([down up]);
axis square;
title (num2str(i));
end