function PHI=showphase1(Y)
PHI=atan2(imag(Y),real(Y));
figure, imagesc(PHI);