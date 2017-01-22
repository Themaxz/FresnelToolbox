
I = cell(5,1,1);
DAT = cell(5,1,1);
patch = [40 30 20 15 5];
for i = 1:5
  [Z,grid,center1]=dist_grid_rect(res,90,b(i),d1);
  %patch(i) = 90.*m(i);
  I{i} = render20_sys_point(PW(:,:,i),patch(i),grid,90);
 % = render20_sys3(field(:,:,13),i,grid,93);
end
for i = 1:4
    DAT{i} = freq_analisys_final(IMAGE{i},I{i},dx,frequency(i),m(i));
end