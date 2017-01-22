C=[-.5:.1:.5];
C=C.*1e-6;
lenght=max(size(C));
NL=[1 -1;1 1; 2 -2; 2 0; 2 2; 3 -3; 3 -1; 3 1; 3 3; 4 -4; 4 -2; 4 0; 4 2; 4 4;];
for i=1:14
%    NL=[1 -1;1 1; 2 -2; 2 0; 2 2; 3 -3; 3 -1; 3 1; 3 3; 4 -4; 4 -2; 4 0; 4 2; 4 4;];
   nl=NL(i,:);
   n=nl(1);
   l=nl(2);
   display(i);
   
   for j=1:lenght
       
       c=C(1,j);
       display(strcat('PW_ab',num2str(n),num2str(l),'_',num2str(c),'.mat'));
        planewave_aberrated1;

   end
   
   
end
