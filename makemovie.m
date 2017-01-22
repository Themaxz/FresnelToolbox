function M=makemovie(P,frames)
up=max(P(:));
down=min(P(:));
for n=1:frames

    imagesc(P(:,:,n)), colormap gray;
    caxis([down up]);
    axis square;
    title (num2str(n));

    M(n)=getframe;
    close all
end
