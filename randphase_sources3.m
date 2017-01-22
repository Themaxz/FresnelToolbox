function Y = randphase_sources3(coherence_index, dimension)

%Y=randphase_sources3(coherence_index,dimension)
%makes a marix of random phases exp(i.*PHI)
%coherence_index is an integer: 1 = coherent, >1 = partial coherence,
%dimension = incoherent
% A coherence_index of n means that there are n x n sources in the region,
% each having diameter dimension/n (i.e. no overlap)

% Simulates a light source in the following fashion
% 1. A number of light sources (depending on coherence_index) are defined
% and arranged in a regular array, and allocated a random phase between -pi and pi
% 2. The size of each source also depends on the degree of coherence required.
% (See later)
% 3. This array of sources is then propagated a large distance, and the
% resultant phase is used as the output phase

% In the coherent limit, there is only one source (ie coherent)
% In the incoherent case, each source is a point source (single pixel)

%

dimension = dimension+1;

if coherence_index == 1
    
    PHI = zeros(dimension);
    
elseif coherence_index <=20

    w = dimension/coherence_index; %width of each source (diameter)
    
    % y will conatin the indices for the location of centre of point sources. x
    % is an intermediate vector
    if coherence_index >= dimension
        x=round(linspace(1,dimension,dimension)); % each pixel is a point source
        y=x;
    else
        y = (w-w/2 : w : dimension);  % centres of sources
        x = y;
        
        r=(2*rand(length(y),1) - 1)*w/4;
        
%         x=round(linspace(1,dimension,3+1/coherence_index)); % create even distribution of point sources depending on coherence length
%         if length(x)>=dimension
%             x=round(linspace(1,dimension,dimension));
%             y=x;
%         else
%             y=(x(2:2:end-1)); %remove sources at edges of region
%         end
    end

    % Define array of point sources
        R_a=zeros(dimension);
        R_p=zeros(dimension);
        
        for l = 1:length(x)
            for k = 1:length(y)
                R_p( round(x(l)+(2*rand - 1)*w/4) , round(y(k)+(2*rand - 1)*w/4) ) = 2*pi*(rand-0.5);   % phase of point sources
                R_a( round(x(l)+(2*rand - 1)*w/4) , round(y(k)+(2*rand - 1)*w/4) ) = 1;                 % amplitude of point sources
            end
        end
%         for l = y %point sources spaced depending on y, and avoiding the edges
%             for k = y
%                 R_p(l,k)=2*pi*(rand-0.5);   % phase of point sources
%                 R_a(l,k)=1;                 % amplitude of point sources
%             end
%         end

        % Define a kernel determine the size of the sources
        K = zeros(dimension);

%         radius_max = dimension/2; %
%         radius = radius_max/length(y);
        radius = w/3;

        [X,Y]=meshgrid(linspace(-dimension/2, dimension/2,dimension));    
        K = X.^2 + Y.^2 < radius.^2;  %kernel
        % Create basis for extended source by defining multiple sources of the
        % required size, by convolving the kernel with the opint source array
        ES_a = ift0(ft0(K).*ft0(R_a)); %amplitude
        ES_p = ift0(ft0(K).*ft0(R_p)); %phase
    
        ES=ES_a.*exp(1i.*ES_p);
    
        P=Makepupilr(1e-3,dimension-1,5e-3);
        P.field = ES;
            
        F=PropagateAngr(P,max(1,180/coherence_index)*getzeta(P,600),600); %Propagate
        
%         figure(1);imagesc(abs(P.field));fs
%         figure(2);imagesc(abs(F.field));fs
%         figure(4);imagesc(log(abs(ft0(abs(F.field)))));fs
%         figure(3);imagesc(phase(F.field));fs
%         
        PHI = atan2(imag(F.field),real(F.field));
        
else
    
    w = dimension/coherence_index; %width of each source (diameter)
    
    % y will conatin the indices for the location of centre of point sources. x
    % is an intermediate vector
    if coherence_index >= dimension
        x=round(linspace(1,dimension,dimension)); % each pixel is a point source
        y=x;
    else
        y = round(w-w/2 : w : dimension);  % centres of sources
%         x=round(linspace(1,dimension,3+1/coherence_index)); % create even distribution of point sources depending on coherence length
%         if length(x)>=dimension
%             x=round(linspace(1,dimension,dimension));
%             y=x;
%         else
%             y=(x(2:2:end-1)); %remove sources at edges of region
%         end
    end

    % Define array of point sources
        R_a=zeros(dimension);
        R_p=zeros(dimension);
        for l = y %point sources spaced depending on y, and avoiding the edges
            for k = y
                R_p(l,k)=2*pi*(rand-0.5);   % phase of point sources
                R_a(l,k)=1;                 % amplitude of point sources
            end
        end

        % Define a kernel determine the size of the sources
        K = zeros(dimension);

%         radius_max = dimension/2; %
%         radius = radius_max/length(y);
        radius = w/2;

        [X,Y]=meshgrid(linspace(-dimension/2, dimension/2,dimension));    
        K = X.^2 + Y.^2 < radius.^2;  %kernel
        % Create basis for extended source by defining multiple sources of the
        % required size, by convolving the kernel with the opint source array
        ES_a = ift0(ft0(K).*ft0(R_a)); %amplitude
        ES_p = ift0(ft0(K).*ft0(R_p)); %phase
    
        ES=ES_a.*exp(1i.*ES_p);
    
        P=Makepupilr(1e-3,dimension-1,5e-3);
        P.field = ES;
            
        F=PropagateAngr(P,max(1,180/coherence_index)*getzeta(P,600),600); %Propagate
        
%         figure(1);imagesc(abs(P.field));fs
%         figure(2);imagesc(abs(F.field));fs
%         figure(4);imagesc(log(abs(ft0(abs(F.field)))));fs
%         figure(3);imagesc(phase(F.field));fs
%         
        PHI = atan2(imag(F.field),real(F.field));
    
end

Y = exp(1i.*PHI);
    