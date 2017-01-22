% for j=1:2
%     magn=[.5  .4 ];
%     m=magn(j);
m=0.5;
    display(strcat('magnification = ', num2str(m)));
        for i=1:1
            c=1e-7;
           NL=[0 0; 1 1; 2 0; 2 2; 3 1];
           nl=NL(i,:);
           n=nl(1);
           l=nl(2);
           display(i);
          sim_setup_text_FL;



        end
        for i=1:4
            c=1e-6;
           NL=[1 1; 2 0; 2 2; 3 1;];
           nl=NL(i,:);
           n=nl(1);
           l=nl(2);
           display(i);
           sim_setup_text_FL;



        end
% end
