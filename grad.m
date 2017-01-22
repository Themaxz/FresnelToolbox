function [px,py]=grad(M,i)
[px,py]=gradient(M(:,:,i),1,10);
v=linspace(-.2e-3,.2e-3,5);
figure, quiver(v,v,px,py);