for j=1:9
    magn=[.5 .45 .4 .35 .3 .25 .2 .15 .1];
    m=magn(j);
    display('magnification = ', num2str(m));
        for i=1:7
            c=1e-6;
           NL=[1 -1;1 1; 2 -2; 2 0; 2 2; 3 1; 3 3;];
           nl=NL(i,:);
           n=nl(1);
           l=nl(2);
           display(i);
          sim_setup_point;



        end
        for i=1:7
            c=1e-7;
           NL=[1 -1;1 1; 2 -2; 2 0; 2 2; 3 1; 3 3;];
           nl=NL(i,:);
           n=nl(1);
           l=nl(2);
           display(i);
           sim_setup_point;



        end
end
