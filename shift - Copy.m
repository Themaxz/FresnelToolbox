%size subimage
pix= 100;
%number of subimages per row and coloumn
num = 35;
%x-shift matrix
tx=padarray(mapx, [12 12]);
%y-shift matrix
ty=padarray(mapy, [12 12]);
%shift cycle
newraw=zeros(pix*num);
t=0;
s=0;
for i=1:num
    for j=1:num
       %extracy i-th and j-th subimage from raw data
        SUB=select_sub(raw,i,j,pix);
        t=maketform('affine',[1 0 0, 0 1 0, tx(i,j) ty(i,j) 1]);
        buffer=imtransform(SUB,t);
        newraw(t:t+pix, s:s+pix)=buffer;
        s=s+1;
    end
    t=t+1;
end
