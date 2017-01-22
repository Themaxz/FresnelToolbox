alpha = [1:0.01:1.3];
IMG = cell(:,:,size(alpha,2));
for i = 1:size(alpha,2)
    IMG{i} = integIMG(shear_a(rad_tot,alpha(i)));
    figure, imagesc(IMG{i}),map;
    title(strcat('alpha = ',num2str(alpha(i))));
    set(gca,'yticklabel',[])
    set(gca,'xticklabel',[])
    export_fig(strcat(num2str(alpha(i)),'.eps'),'-eps','-transparent');
    
end
mov_I = makemovie_cell(IMG, size(alpha,2));
% for i = 1:13
% figure, imagesc(IMG{i}), map;
%     title(strcat('alpha = ',num2str(alpha(i))));
% 
% waitforbuttonpress ;
% close all
% 
% end
spectrum = cell(:,:,30);
for i = 1:30

    buffer = IMG{i}(10:40,:);
    spectrum{i} = abs(ft0(buffer));
    spectrum{i}(round(end./2)-2:round(end./2)+2,round(end./2)-2:round(end./2)+2)=0;
%     SNR(i) = mean(buffer(:))./var(buffer(:));
    somma(i) = sum(spectrum{i}(:));
end