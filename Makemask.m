function M=Makemask(dim,filter)
M=ones(dim);
l=dim./2;
l=round(l);
%M(420:540,420:540)=1;
 for n=1:dim
     for m=1:dim
         if m>filter
             M(n,m)=0;
         end
     end
end


figure, imagesc(M);
for n=1:dim
     for m=1:dim
         if n>filter
             M(n,m)=0;
         end
     end
end
figure, imagesc(M);