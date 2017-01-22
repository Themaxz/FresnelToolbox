close all
% FIELD=NEW_FIELD;
%load EDGE_THESIS.mat
FIELD = field;
x=[-w:dx:w];
x=x(600:1200);
% edge=P.field./sum(P.field(:));
% edge=rot90(edge,2);
edge=rot90(P.field(:,round(end./2)),2);
edge=edge./sum(edge(:));
edge=edge(600:1200);
%n=[5 10 15 20 30 40 50 60 80 100 150 200 300 400 500];
%n=[5 10 15 20 30 40 50 100 150 200 300 400 500];
% edge=edge(600:1200);
for i=1:size(FIELD,3)
    field1=FIELD(:,:,i);
    field1=field1./sum(field1(:));
    profile(:,i)=sum(field1(600:1200,600:1200),2);
   % profile(:,i)=profile(:,i)./sum(profile(:,i));
    s(i)=mean2(field1);
    buffer=profile(:,i);
    %s1(i)=sum(field1(:))./size(field(1)
    N_rms(i) = mean(field1(:)-(mean(field1(:)))).^2; %autocorrelation of the noise
    N_rms1(i) = mean(field1(:).^2)-(mean(field1(:))).^2;
    %N_rms(i)=var(field1(:,i));
    SNR(i)=20.*log(s(i)./sqrt(N_rms(i))); 
    SNR1(i)=20.*log(s(i)./sqrt(N_rms1(i))); 
%     figure, plot(sum(field(600:1200,600:1200,i),2)), title(strcat(num2str(n(i)),' iterations'));
    %figure, plot(profile(:,i)), title(strcat(num2str(coherence(i)),' spatial coherence parameter'));
end
%coherent=FIELD(:,:,1);
edge = edge./max(edge(:));
edge = edge.* 0.00105*1e3;
coherent=coherent./sum(coherent(:));
coherentp=sum(coherent(600:1200,600:1200),2);
figure,handle =  plot(x,edge,'g'),  title('Coherent and incoherent image of an edge'); 
hold on
plot(x,2.*coherentp.*1e3,'b');
x2 = -0.001501;
y2 = 0.2433;
str2 = '\leftarrow coherent edge detection = 0.2433';
text(x2,y2,str2)
plot(x,profile(:,end).*1e3,'r');
x1 = -0.001501;
y1 = 0.4941;
str1 = '\leftarrow incoherent edge detection = 0.4941';
text(x1,y1,str1)
legend('Edge','coherent image','incoherent image');
xlabel('Position (m)');
ylabel('Normalized Intensity (a.u)');
set(findall(gcf,'type','text'),'FontSize',25,'fontWeight','bold')
export_fig 2dedge.eps -eps -transparent

%saveas(handle,'Coherent_edge_pres.png','png');
% for k=2:5
%     plot(x,profile(:,k));
% end
%figure, plot(coherence, SNR),title('SNR (dB)');
%figure, plot(coherence,N_rms,'*');
% p0 = polyfit(n,SNR,12);
% f0 = polyval(SNR,n);
% figure, plot(n,f0), title('SNR (dB)');