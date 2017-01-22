% FIELD=field;
% field=field(:,:,10:17);
% Z=z;
% 
% z=z(10:17);
% z=Z(1:10);
% field=FIELD(:,:,1:10);
lower = 40;
upper = 50;
%grid95;
[Z,grid,center1]=dist_grid_rect(res,pix,b,d1);
close all
k=1;
pitch=[1:1:90];
clear SNR
clear N_rms
clear s

patch_size=zeros(size(field,3),1);
%reference object
OBJ = P1.field;
IMG2 = 1-OBJ;
edges=round(size(IMG2,1)*.25);

%figure, imagesc(IMG2(size(IMG2,1)./2-edges:size(IMG2,1)./2+edges,size(IMG2,1)./2-edges:size(IMG2,1)./2+edges)), title(num2str(pitch(i))), map;
BOX=(IMG2(round(size(IMG2,1)./2)-edges:round(size(IMG2,1)./2)+edges,round(size(IMG2,1)./2)-edges:round(size(IMG2,1)./2)+edges));
%BOX=IMG2;
BOXref=BOX-mean(BOX(:));
%prof_REF=sum(BOXref,1);




a = cell(21,90,1);
b = a;

for j=1:size(field,3)
    display(strcat('loop ',num2str(j)));
for i=1:size(pitch,2)
   buffer=field(:,:,j);

IMG2=render20_sys3(buffer,pitch(i),grid,93);
% figure, imagesc(IMG2), map, title(num2str(i));
% figure, plot(IMG2(size(IMG2,1)./2-50:size(IMG2,1)./2+50,size(IMG2,1)./2)), title(num2str(i));
IMG=IMG2./max(IMG2(:));
IMG2=1-IMG2;
a{i,j,:} = IMG2;

edges=round(size(IMG2,1)*.25);

%figure, imagesc(IMG2(size(IMG2,1)./2-edges:size(IMG2,1)./2+edges,size(IMG2,1)./2-edges:size(IMG2,1)./2+edges)), title(num2str(pitch(i))), map;
BOX=(IMG2(size(IMG2,1)./2-edges:size(IMG2,1)./2+edges,size(IMG2,1)./2-edges:size(IMG2,1)./2+edges));
%BOX=IMG2;
BOXn=BOX-mean(BOX(:));
ratio = size(BOXn,1)./size(BOXref,1);
buffer = imresize(BOXref,ratio);
prof=sum(BOX,1);
xx=[-size(BOX,1)./2:1:(size(BOX,1)./2)-1].*dx;
%signal to noise ratio
%noise(j,i)=std(abs(BOX(:)));
%signal(j,i)=mean(abs(BOX(:)));
%test code might be bullshit
buffer = buffer./max(buffer(:));
BOXn = BOXn./max(BOXn(:));
if size(BOXn,1) ~= size(buffer,1)
    if size(BOXn,1) > size(buffer,1)
        BOXn = BOXn(1:end+(size(BOXn,1) - size(buffer,1)),1:end+(size(BOXn,1) - size(buffer,1)));
    end
    if size(BOXn,1) < size(buffer,1)
             buffer = buffer(1:end+(size(BOXn,1) - size(buffer,1)),1:end+(size(BOXn,1) - size(buffer,1)));
    end
end
        
b{i,j,:}=sum(BOXn,1);       
        
diff = abs(BOXn-buffer);
noise(j,i)=mean(diff(:));
signal(j,i)=mean(abs(BOX(:)));

%figure, plot(IMG2(size(IMG2,1)./2-edges:size(IMG2,1)./2+edges,size(IMG2,1)./2)+10), title(num2str(i));
%figure, plot(prof), title(num2str(pitch(i)));
%spectral desity

X=ft0(BOX).*conj(ft0(BOX));
df=1./dx;
f=1./(xx);
xp(i) = libpointer('doublePtr',X);
rms(i)=(1./2*pi).*sum(X(:));
%rms noise
 N_rms(j,i) = mean(BOXn(:).^2-(mean(BOXn(:))).^2); %autocorrelation of the noise
 SNR(j,i)=20.*log(signal(j,i)./(noise(j,i)));
%Rxx0(i) = mean(BOX(:).^2);% aoutocorrelation of the signal for t=0;

%figure, plot(X), title(num2str(pitch(i)));
k=k+1;
end
end

figure, plot(pitch,SNR,'*'), title('SNR (dB)');
%figure, plot(pitch,N_rms./max(N_rms(:)),'b'), title('autocorrelation of the noise');
figure, plot(pitch,N_rms), title('autocorrelation of the noise');
fake_bode;
% for i=1:size(patch_size,2)
%     IMG(:,:,i)=render20_sys3(field(:,:,i),patch_size(i),grid,93);
% end

% for i=1:size(field,3)
% p0(:,i) = polyfit(pitch,noise(i,:),12);
% f0 = polyval(p0(:,i),pitch);
% figure, plot(pitch,f0), title('autocorrelation of the noise fit');
% hold on;
% plot(pitch,N_rms(i,:));
% [minimum(i) patch1(i)] = min(f0);
% end
% for i=1:5
% snr0(:,i) = polyfit(pitch,SNR(i,:),12);
% snr1 = polyval(snr0(:,i),pitch);
% fit(:,i)=snr1;
% half1=fit(1:lower,1)';
% half2=fit(upper:end,1)';
% p0 = polyfit(pitch(1:lower),half1,1);
% p1 = polyfit(pitch(upper:end),half2,1);
% y1=p0(1).*pitch+p0(2); %fit line of the low pitch zone
% y2=p1(1).*pitch+p1(2); %fit line of the high pitch zone
% figure, plot(pitch,snr1), title(strcat('SNR fit',num2str(i)));
% hold on;
% plot(pitch,y1,'g');
% plot(pitch,y2,'r');
% for k=1:size(pitch,1)
%     if y1(k)==y2(k)
%        patch_size(i) = k;
%     end
% end
% %plot(pitch,SNR(i,:));
% [minimum(i) patch(i)] = min(f0);
% end
%fake_bode;

% hold
% plot(pitch,N_rms1./max(N_rms1(:)),'r');
% 
% plot(pitch,N_rms2./max(N_rms2(:)),'g');
% 
% plot(pitch,N_rms3./max(N_rms3(:)),'c');
% 
% plot(pitch,N_rms4./max(N_rms4(:)),'y');
% k=1;
% [minimum(k),patch_size(k)]=min(N_rms(:));
% k=k+1;
% [minimum(k),patch_size(k)]=min(N_rms1(:));
% k=k+1;
% [minimum(k),patch_size(k)]=min(N_rms2(:));
% k=k+1;
% [minimum(k),patch_size(k)]=min(N_rms3(:));
% k=k+1;
% [minimum(k),patch_size(k)]=min(N_rms4(:));

