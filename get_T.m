function t=get_T(focal,def)
b=LensLaw(focal,(2.*focal)+def);
t=2.*focal-b;
t=t./2;
