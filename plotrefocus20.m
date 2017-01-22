for i = 0.1:0.1:1
    
    IMGc_r = render20_sys3(PWc.field,round(pix.*i),gr,pix);
    figure, imagesc(IMGc_r),map;
    title(num2str(i));
end