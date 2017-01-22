function W=Makegrid_square(range,pixel,lens_radius)
G=zeros(pixel);
if size(pixel)==1
    pixel=[pixel pixel];
end
if size(range)==1
    range=[range range];
end
[XI,ETA,dxi]=Objectplane(range,pixel);
pixel_radius=round(lens_radius./dxi);
step=2*pixel_radius;
i=0;
index=0;
for k=1:step:pixel(1)
    index=index+1;   
    
       
            for j=1:step:pixel(2)  
                G(k,j)=1;
                i=i+1;
            end
        
    end
   
  

W.field=G;

W.dxi=dxi;
W.num_lenslet=i;