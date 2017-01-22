close all
clear all
dim=5000;
t=.0005;

y=rand(dim);
for j=1:dim
for i=1:dim
if y(i,j)<t
y(i,j)=0;
else
y(i,j)=1;
end
end
end
figure, imagesc(y), map;
% saveas(figure(1),strcat('randpattern',num2str(t),num2str(dim),'.bmp'),'bmp');