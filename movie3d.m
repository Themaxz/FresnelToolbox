function M=movie3d(P,frames,X,Y,Z)
mm=max(size(X));
for n=1:frames

    figure, slice(X,Y,Z,P,mm,mm,[1:n]);
    axis square;
    title (num2str(n));

    M(n)=getframe;

end
