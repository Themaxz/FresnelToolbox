

for i=1:4
    c=1e-6;
   NL=[1 1; 2 -2; 2 0; 3 1];
   nl=NL(i,:);
   n=nl(1);
   l=nl(2);
   display(i);
   sim_setup_text;
   
   
   
end
% for i=1:7
%     c=1e-7;
%    NL=[1 -1;1 1; 2 -2; 2 0; 2 2; 3 1; 3 3;];
%    nl=NL(i,:);
%    n=nl(1);
%    l=nl(2);
%    display(i);
%    sim_setup_text;
%    
%    
%    
% end