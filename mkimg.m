[Z,gr,center1]=dist_grid_rect(res,pix,b,z1);
i=1;
for m=0.45:0.01:0.55
    IMG=render20_sys2(raw,m,gr,90);
    xp(i)=libpointer('doublePtr',IMG);
    i=i+1;
end