function mm = refocus20(def,z1,z2,f_lens,f_micro,a)
% z2_  = ((z1+def).*f_lens)./((z1+def)+f_lens);
% %a = b.*f_micro./(b+f_micro);
% def1 = z2_-z2;
% a1 = def1+a;
% m1 = b./a1;
%  

zz2 = Lenslaw(f_lens,z1+def);
aa = zz2-z2;
aa = a-aa;
bb = lenslaw(f_micro,aa);
mm = bb./aa;
