tresh = 0;
spectrum = cell(:,:,5);
spectrum2 = spectrum;
somma = zeros(1,1);
dx = M.lens_diameter;
dF = 1./(101.*dx);
F = [-(1./(2.*dx)):dF:(1./(2.*dx))-1];
for i = 1:5
    [S,LF] = LightField(RAW{i},sqrt(M.num_lenslet));
    IMG{i} = integIMG(LF);
    buffer = IMG{i};%(10:40,:);
    
    buffer(isnan(buffer))=0;
    
    buffer2 = integIMG(shear_a(LF,alpha(i)));%(10:40,:);
    
    buffer2(isnan(buffer2))=0;
    spectrum{i} = abs(ft0(buffer));
    spectrum2{i} = abs(ft0(buffer2));
    %spectrum{i}(round(end./2)-tresh:round(end./2)+tresh,round(end./2)-tresh:round(end./2)+tresh)=0;
%     SNR(i) = mean(buffer(:))./var(buffer(:));
  %  somma(i) = sum(spectrum{i}(:));
    figure, plot(F,(abs(sum(spectrum{i},2)./max(spectrum{i}(:)))));
    title(num2str(alpha(i)));
    hold on
   plot(F,(abs(sum(spectrum2{i},2)./max(spectrum2{i}(:)))),'r');
    title(num2str(alpha(i)));
end
% profile = cell(:,:,5);
% profile2 = profile;
% for i = 1:5
%     [S,LF] = LightField(RAW{i},sqrt(M.num_lenslet));
%     buffer = IMG{i};%(10:40,:);
%     
%     buffer(isnan(buffer))=0;
%     
%     buffer2 = integIMG(shear_a(LF,alpha(i)));%(10:40,:);
%     
%     buffer2(isnan(buffer2))=0;
%    profile{i} = sum(buffer,2);
%     profile2{i} = sum(buffer2,2);
%     %spectrum{i}(round(end./2)-tresh:round(end./2)+tresh,round(end./2)-tresh:round(end./2)+tresh)=0;
% %     SNR(i) = mean(buffer(:))./var(buffer(:));
%   %  somma(i) = sum(spectrum{i}(:));
%     figure, plot(F,(abs(sum(profile{i},2)./sum(profile{i}(:)))));
%     title(num2str(alpha(i)));
%     hold on
%    plot(F,(abs(sum(profile2{i},2)./sum(profile2{i}(:)))),'r');
%     %title(num2str(alpha(i)));
% end