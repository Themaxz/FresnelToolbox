function alpha=getalpha(d,focal)
l=1./(-d);
f=1./(focal);
l_=l+f;
d_=1./l_;
alpha=d_./focal;


