[FileName,PathName] = uigetfile('*.png','Select the raw image to render');
raw2=im2double(imread(strcat(PathName,FileName)));
if ~exist('gr') %#ok<EXIST>
    calib_grid;
end
%%
figure, imagesc(raw2+gr);
pix=input('Enter subimage resolution: ');
m=input('Enter magenification: ');
%%
IMG=render20_sys3(raw2,round(pix.*m),gr,pix);
fig=imagesc(IMG); colormap gray;
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
export_fig(num2str(m),'-eps','-transparent');
