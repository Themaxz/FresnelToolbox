fmax = 1./P.dxi
F=linspace(-fmax./2,fmax./2,2000);
pBL = BL(end./2, :);
fBL = abs(ft0(pBL./mean(pBL)));
fBL(end./2-10:end./2+10) = 0;
figure, plot(F,fBL), title('Band Limited Angular Spectrum');;
xlabel('spatial frequency (1/m)');
ylabel('power spectrum (a.u)');
pcBL = cBL(end./2, :);
fcBL = abs(ft0(pcBL./mean(pcBL)));
fcBL(end./2-10:end./2+10) = 0;
figure, plot(F,fcBL), title('Corrected Band Limited Angular Spectrum');
pAS = AS(end./2, :);
fAS = abs(ft0(pAS./mean(pAS(:))));
fAS(end./2-10:end./2+10) = 0;
figure, plot(F,fAS), title('Angular Spectrum');
xlabel('spatial frequency (1/m)');
ylabel('power spectrum (a.u)');
pPR = PR(end./2, :);
fPR = abs(ft0(pPR./mean(pPR)));
fPR(end./2-10:end./2+10) = 0;
figure, plot(pPR), title('Multi Step');
figure, plot(pBL), title('Band Limited');
figure, plot(pcBL), title('Corrected Band Limited');
figure, plot(pAS), title('Angular Spectrum');