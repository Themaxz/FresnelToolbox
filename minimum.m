thresh = .6e-3;
alpha_c = cell(:,:,10);
for i = 1:10
y = somma(i,:);

dy = diff(y);
%[m(i), h(i)] = max((y));
% figure, plot(a,y);
% title(strcat('High Frequency Power Spectrum vs alpha'));
% xlabel('alpha');
%  ylabel('Normalized power spectrum (a.u.)');
 %figure, plot(dy);
 zeri = sign(dy);
 for j = 1:size(dy,2)-1
     if(zeri(j)>zeri(j+1))
         candidate(j) = y(j);
     else
         candidate(j)=0;
     end
 end
 ddy = diff(dy);
 maxima=(find(candidate~=0));
  values(i) = find(y==max(y(maxima)));


   alpha_c {i}= a(find((candidate~=0)));
%  candidates = find(dy>0&dy<thresh);
%   ddy = diff(dy);
%  [values,index] = find(ddy(candidates)>0);
% %  [values,index] = max(y(candidates));
% %  %index = find(values>0);
%   maxima(i) = a(candidates(index));
  
 
% [mm,index] = max(y);
% strValues = strtrim(cellstr(num2str([mm,index],'(%d,%d)')));
% text(mm,index,strValues,'VerticalAlignment','bottom');
% export_fig(strcat('refocus',num2str(alpha(i)),'.eps'),'-eps','-transparent');
%hold on
%figure, plot(dy,'r');
end
ext_a = a(values);