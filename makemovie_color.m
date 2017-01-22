function M=makemovie_color(P,frames)
for n=1:frames

    figure, imagesc(P(:,:,n)); %colormap gray;
    axis square;
    colorbar;
    title (num2str(n));

    M(n)=getframe;

end
