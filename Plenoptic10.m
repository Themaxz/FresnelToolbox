%Fresnel propagation
if z1==z2
    P1=AngularBL(P,z1,633);
    P2=throughlens(P1,L,633);
    P3=AngularBL(P2,z2,633);
	image=abs(P3.field).^2;
    P3.field=P3.field.*M.field;
    P4=AngularBL(P3,z3,633);
    raw=abs(P4.field).^2;
    [S,rad]=LightField(raw, sqrt(M.num_lenslet));
else
    P1=AngularBL(P,z1,633);
    P2=throughlens(P1,L,633);
    P3=AngularBL(P2,z2,633);
    image=abs(P3.field).^2;
    P3.field=P3.field.*M.field;
    P4=AngularBL(P3,z3,633);
    raw1=abs(P4.field).^2;
    [S,rad1]=LightField(raw1, sqrt(M.num_lenslet));
    def=z1-z2;
end