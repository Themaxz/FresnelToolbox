for plane = 1:5
%plane = 2;
%alpharef = alpha; 
a = [0.7:0.005:1.2];
[S rad_tot] = LightField(RAW{plane},sqrt(M.num_lenslet)); 
IMG = cell(:,:,size(a,2));
for i = 1:size(a,2)
    IMG{i} = integIMG(shear_a(rad_tot,a(i)));
    %IMG{i}(isnan(IMG{i}))=0;

%     figure, imagesc(IMG{i}),map;
%     title(strcat('alpha = ',num2str(alpha(i))));
%     set(gca,'yticklabel',[])
%     set(gca,'xticklabel',[])
%     export_fig(strcat(num2str(alpha(i)),'.eps'),'-eps','-transparent');
    
end
%mov_I = makemovie_cell(IMG, size(a,2));
% for i = 1:13
% figure, imagesc(IMG{i}), map;
%     title(strcat('alpha = ',num2str(alpha(i))));
% 
% waitforbuttonpress ;
% close all
% 
% end
tresh = 2;
spectrum = cell(:,:,size(a,2));
somma = zeros(9,size(a,2));
for i = 1:size(a,2)

    buffer = IMG{i};%(10:40,:);
    buffer(isnan(buffer))=0;
    spectrum{i} = abs(ft0(buffer));
    spectrum{i}(round(end./2)-tresh:round(end./2)+tresh,round(end./2)-tresh:round(end./2)+tresh)=0;
%     SNR(i) = mean(buffer(:))./var(buffer(:));
    somma(plane,i) = sum(spectrum{i}(:));
end

end
% spectrum = cell(:,:,30);
% for i = 1:30
% 
%     buffer = IMG{i}(10:40,:);
%     spectrum{i} = abs(ft0(buffer));
%     spectrum{i}(round(end./2)-2:round(end./2)+2,round(end./2)-2:round(end./2)+2)=0;
% %     SNR(i) = mean(buffer(:))./var(buffer(:));
%     somma(i) = sum(spectrum{i}(:));
% end