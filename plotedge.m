%n = [5 20 50 100 200 300 500];
n=[5 10 15 20 30 40 50 60 80 100 150 200 300 400 500 750 1000 90 120 170 220 250 320 350 450 550 650 850 950 1100];
nn = sort(n);
x = linspace(-w(1)./2,w(1)./2,res(1));
[X,Y] = meshgrid(x);
SNR = zeros(size(n,2),1);
noise = zeros(size(n,2),1);
signal = zeros(6,1);
upper = round(res./2+600);
lower = round(res./2-600);
for i = 1:size(FUSION,3)
  %  I{i} = render20_sys3(field(:,:,13),i,grid,93);
  image = FUSION(lower:upper,lower:upper,i);
 % figure,h =  imagesc(x,x,image);
 % map, title(strcat('Number of sources: ',num2str(n(i))));
 % saveas(h,strcat('USAF param',num2str((n(i)))),'png');
  noise(i,1)=std(image(:));
  signal(i,1)=mean(image(:));
  SNR (i,1) = 20.*log(signal(i,1)./noise(i,1));
%   if (i>5)
%      V(i-5) = var(SNR(i-5:i)); 
%      if (V(i-5)<0.01)
%          line = i;
%        % b%reak
%      end
%   end
end
difference = zeros(size(n,2),1);
for i = 2:size(n,2)
    difference(i) = (SNR(i)-SNR(i-1));
end
figure,pl =  plot(n,SNR,'*');
title('SNR(dB) vs Iteration');
%hold on
%plot(n,line);
saveas(pl,'SNR_iterations','png');
%hold off
   % var(SNR(i))


% hold on
% meanSNR = mean(SNR(17:end));
% stdSNR = var(SNR(17:end));
% line1 = meanSNR;
% line2 = line1+stdSNR;
% line3 = line1-stdSNR;
% plot(n,line1);
% plot(n,line2);
% plot(n,line3);
% 
% hold off

% figure, plot(n,difference,'*');
% title ('stability');


%hold on
% p0 = polyfit(n,SNR',8);
% p1 = polyval(p0,n);
% plot(n,p1,'r');
% hold off
%f = fit(n',SNR,'smoothingspline');
%figure,pl = plot(f,n,SNR);
%title('SNR(dB) vs Number of Sources');
%axis([0,500,9,20])
%saveas(pl,'SNR_sources','png');
