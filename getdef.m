function def=getdef(d,alpha,focal)
l=1./(-d);
f=1./(focal);
l_=l+f;
d_=1./l_;
d_=alpha.*focal;
def=d-d_;



