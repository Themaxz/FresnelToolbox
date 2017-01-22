clear IMGstak
k=1;
for i=-5:1:5
t=i;
IMGstak(:,:,k)=integIMG(shear(rad3,t));
s=size(IMGstak);
index(k)=i;

profile(:,k)=IMGstak(:,(s(2)./2),k);
k=k+1;
% P=IMGstak(:,:,k);
% figure, imagesc(P);
save('H100b.mat');
end