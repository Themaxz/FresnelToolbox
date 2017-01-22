function P1=Padding(P,pad)

if ~exist('pad')
    pad=1000;
else
    pad=pad;
end
P1.field=padarray(P.field,[pad pad]);
s=max(size(P1.field));
s=s-1;
newrange=P.DXI+(P.dxi.*(2*pad));
[xi1,XI1,ETA1,dxi1]=Objectplane(newrange,s);
c=countvalues(P1.field(:,s/2),1);
P1.xi=xi1;
P1.XI=XI1;
P1.ETA=ETA1;
P1.DXI=newrange;
P1.dxi=dxi1;
P1.diameter=c.*dxi1;