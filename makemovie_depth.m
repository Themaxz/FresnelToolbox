function M=makemovie_depth(P,frames,z)
for n=1:frames

    figure, imagesc(P(:,:,n)); %colormap gray;
    axis square;
    colorbar;
    title (num2str(z(n)));

    M(n)=getframe;

end
