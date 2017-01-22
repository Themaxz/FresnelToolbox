function M=makemovie(P,frames);
for n=1:frames

imagesc(P(:,:,n));
axis square;
title (num2str(n));

M(n)=getframe;

end
