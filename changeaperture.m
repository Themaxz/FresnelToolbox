img = cell(:,:,10);
av = zeros(1,10);
for i = 1:10
  img{i} = aperture(L,i)  ;
  av(i) = mean(img{i}(:));
end