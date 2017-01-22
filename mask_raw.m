s=size(map);
mask=map;
thresh1=1;
thresh2=-1;
for i=1:s(1)
    for j=1:s(2)
    
        if abs(map(i,j))>=1
            mask(i,j)=0;
        else
            mask(i,j)=1;
        end
    
    end
end
IMG=render20(raw1,50,100);
IMG2=render20_mask(raw1,50,100,mask);
IMG1=render20(FIELD,50,100);
figure, imagesc(IMG),colormap gray;
figure, imagesc(IMG1), colormap gray;
figure, imagesc(IMG2),colormap gray;
figure, imagesc(image), colormap gray;

