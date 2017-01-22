res=[4500 4500]

% GenerateRandomImage;
field=ones(res);
clear m
m=.5;
close all

    display(strcat('magnification = ', num2str(m)));
        for i=1:5
            c=1e-7;
           NL=[0 0; 1 1; 2 0; 2 2; 3 1];
           nl=NL(i,:);
           n=nl(1);
           l=nl(2);
           display(i);
          sim_setup_random_FL;



        end
        for i=1:5
            c=1e-6;
           NL=[0 0; 1 1; 2 0; 2 2; 3 1;];
           nl=NL(i,:);
           n=nl(1);
           l=nl(2);
           display(i);
           sim_setup_text_FL;



        end

