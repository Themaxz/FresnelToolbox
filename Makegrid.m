function W=Makegrid(range,pixel,lens_radius)
G=zeros(pixel);
[xi,XI,ETA,dxi]=Objectplane(range,pixel);
pixel_radius=round(lens_radius./dxi);
step=2*pixel_radius;
i=0;
index=0;
for k=1:step:pixel
    index=index+1;   
    
        if mod(index,2)==1
            for j=1:step:pixel
                p=k.*sqrt(3)./2;
                G(p,j)=1;
                i=i+1;
            end
        else
            for j=pixel_radius:step:pixel-pixel_radius    
                p=k.*sqrt(3)./2;
                G(p,j)=1;
                i=i+1;
            end
        end
    end
   
  
figure, imshow(G,[]);
W.field=G;

W.dxi=dxi;
W.num_lenslet=i;