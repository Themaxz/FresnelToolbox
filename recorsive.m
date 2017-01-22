% raw_ab=LI.field;
for i=1:3
    correlation_simple_HM;
    b=7.8e-3;
    [Z,grid,center]=dist_grid(res,pix,b,z1);
    raw1=shift_raw(raw_ab,90,pix_x,pix_y,center);
    raw_ab=raw1;
    close all
end
map=(sqrt(pix_x+pix_y).^2);
