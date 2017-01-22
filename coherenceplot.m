figure, plot(x(1,1000:2000),p1(1,1000:2000),'b');
hold
plot(x(1,1000:2000),p2(1,1000:2000),'r');

xlabel('lenght (m)');
ylabel('intensity (a.u.)');
legend('main lens image','rendered image');
title('Intensity Profile');
saveas(figure(1),strcat(date,'plot1',num2str(m),'-',num2str(cutoff),'.fig'));
saveas(figure(1),strcat(date,'plot1',num2str(m),'-',num2str(cutoff),'.jpg'));

figure, plot(f(1,1000:2000),abs(ft0(p1(1,1000:2000)))./max(abs(ft0(p1(1,1000:2000)))),'b');
hold
plot(f(1,1000:2000),abs(ft0(p2(1,1000:2000)))./max(abs(ft0(p2(1,1000:2000)))),'r',f(1,1000:2000),r,'c');
% hold
% plot(f(1,1000:2000),r,'c');
legend('main lens image','rendered image','cutoff');
xlabel('spatial frequency(cycle/m)');
ylabel('normalized power spectrum (a.u.)');
title('Spectrum');
saveas(figure(2),strcat(date,'plot2',num2str(m),'-',num2str(cutoff),'.fig'));
saveas(figure(2),strcat(date,'plot2',num2str(m),'-',num2str(cutoff),'.jpg'));
