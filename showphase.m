function PHI=showphase(Y)
PHI=atan2(imag(Y),real(Y));
figure, imagesc(PHI);