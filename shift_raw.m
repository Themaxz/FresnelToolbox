function raw1=shift_raw(raw,pix,shift_x,shift_y,center,offset)
%raw1=shift_raw(raw,pix,shift_x,shift_y,offset)
%Shift the each elemental image according to shift_x and shift_y
if ~exist('offset')
    offset=[0 0];
end


raw1=zeros(size(raw));




[S,num]=subimages(raw,pix,center); %creating stack of elemental images
res_img=size(num.*pix);

k=1;
%spatial frequency vector

dF=1./(pix); 

F=dF.*(pix-1);

fx=(-F(1)./2):dF(1):(F(1)./2);
fy=fx;
[fx,fy]=meshgrid(fy,fx);

  for m=1:num(1)
        for n=1:num(2)
            
            FS=ft0(S(:,:,k)); %fourier transform of the elem   elemental image
            FS=FS.*exp(1i.*2.*pi.*(fx.*(-shift_x(m,n))+fy.*(-shift_y(m,n))));
            S1(:,:,k)=ift0(FS); %#ok<AGROW>
            k=k+1;
        end
    end
k=1;
for i=1:pix:res_img(1)
    for j=1:pix:res_img(2)
        
        
        
        raw1(i:i+pix-1,j:j+pix-1)=(S1(:,:,k)); %tiling subimages together
%         figure, imagesc(abs(raw1));
        k=k+1;
    end
end
raw1=abs(raw1);
