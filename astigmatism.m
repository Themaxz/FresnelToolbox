D=[.25:.25:6];
z1=120e-3;
aperture=1e-3;
s=max(size(D));

for k=1:s
    [c1(k), c2(k)]=convertCyl2Zernikes(z1,D(k),aperture,1);
end
filename='astigmatism2diott.xlsx';

C=cat(2,c1',c2',D');
 xlswrite(filename,C);

