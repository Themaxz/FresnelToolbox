function U1=virtual_lens(U,aperture)
field=U.field;
phase=atan2(imag(field),real(field));
phase=-phase;
field=abs(field);
field=field.*exp(-1i.*phase);
% field=field.*phase;
P=Makepupil(U.DXI,size(U.field),aperture);
field=field.*P.field;
U1=U;
U1.field=field;
