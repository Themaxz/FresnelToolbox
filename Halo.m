function H=Halo(range,pixel,r1,r2)
D=PoissonSpot(range,pixel,r1);
P=Makepupil(range,pixel,r2);
F=P.field+D.field;
dim=size(F);
for i=1:dim(1)
for j=1:dim(2)
if F(i,j)==1
F(i,j)=0;
else
F(i,j)=1;
end
end
end
close all
H=D;
H.field=F;
figure, imagesc(F)