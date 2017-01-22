c = 299792458;
for i = 1:size(intensity,1)
    if intensity(i) >=0.5
        x1 = lambda(i);
        break;
    end
end
for j = i:size(intensity,1)
    if intensity(j) <=0.5
        x2 = lambda(j);
        break;
    end
end
FWHM = x2-x1;
dlambda = FWHM.*1e-9;
delta_v = c./dlambda;
tau = 1./delta_v;
lc = tau.*c;