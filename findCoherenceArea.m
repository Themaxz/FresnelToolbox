function coh_area = findCoherenceArea(coherence_index, sampling, CohArea_upper_limit, nIntegrations, zero_threshold)

%% findCoherenceArea calculates the coherence area (in pixels^2) of a complex field created by randphase_sources
%
% Generates complex amplitude field using randphase_sources (with given coherence_index
% and sampling) then duplicates it and adds tilt to the duplicate. The
% field and its tilted copy are then added (in amplitude) to interfere
% them, giving perfect tilt fringes. This process is repeated by shifting
% the field with respect to its tilted copy by k pixels (k is even for
% computational reasons). The contrast of the fringes produced will
% decrease as the shift between the two fields increases until it reaches
% zero (no fringes) once the shift is greater than the transverse coherence 
% length (sqrt of coherence area). This therefore represents the coherence
% area of the field. In order to account for the stochastic process
% generating the fields, the fringes are obtained by integrating over
% nIntegrations (default = 20). The modulation of the fringes is measured
% using the Fourier domain method.
%
% The maximum shift between the fields is equal to the sqrt of
% CohArea_upper_limit (i.e. the transverse coherence length upper limit).
% This must therefore be large enough otherwise no value will be returned
% for the coherence area. If this upper limit is too large though,
% computational time is lengthened unnecessarily. Output plot of modulation
% v. transverse coherence length should give an idea of where zero is
% reached.
%
% INPUTS:   coherence_index, as per randphase_sources (ranging from 1 to
%                       sampling with 1 being perfectly coherent and sampling
%                       being perfectly incoherent)
%           sampling, number of pixels
%           CohArea_upper_limit, determines how far to search for coherence
%                       area limit. Too small and coherence area will not
%                       be found, too large and the computation time will
%                       be long. DEFAULT = 2500 [50^2]
%           nIntegrations, number of fields to sum, representing
%                       integration in time. More relavant for fields
%                       closer to the coherence end of spectrum. DEFAULT = 20
%           zero_threshold, determine the threshold use to decide when
%                       fringes have reached 'zero' modulation, as zero itself
%                       is not reached. DEFAULT = 0.01
%
% S. Gruppetta, 2013

if ~exist('CohArea_upper_limit')
    CohArea_upper_limit = 50^2;
end
if ~exist('nIntegrations')
    nIntegrations = 20;
end
if ~exist('zero_threshold')
    zero_threshold = 0.01;
end

%shift is effictively the seperation of two pinholes within the field to find the coherence area. i.e. shift must be larger than the coherence area
maximum_shift = round(sqrt(CohArea_upper_limit)) + mod(round(sqrt(CohArea_upper_limit)),2); %make even if odd

nFields = nIntegrations;

mod_thr = zero_threshold; %threshold for modulation at which edge of coherence area is determined (as it is not reasonable to wait till modulation = 0)

% Generate tilt to create intereference fringes
x = -1:2/sampling:1; %rho will be defined based on x, hence normalised to unity
[X,Y] = meshgrid(x,x);
[th,rho] = cart2pol(X,Y);

Tilt = exp(i*2*pi*4.88e-6*Z(1,1,rho,th)/630e-9);

Y=randphase_sources(coherence_index,sampling);
Y2 = Y.*Tilt;

modulation = zeros(1,maximum_shift+1);

for m=1:2:maximum_shift+1
    k=m-1;
    fringes_final = 0;
    for p = 1:nFields
        Y=randphase_sources(coherence_index,sampling);
        Y2 = Y.*Tilt;
        fringes = abs(0.5*(Y(1:end-k,:) + Y2(k+1:end,:))).^2;
        fringes_final = fringes_final + fringes;
        (fprintf('.'));
    end
    disp(k)
    F_fringes = abs(ft0(padarray(fringes_final,[sampling+k/2 sampling])));
    norm = max(F_fringes(:));
    F_fringes = abs(ft0(padarray(fringes_final-mean(fringes_final(:)),[sampling+k/2 sampling])));
    F_fringes = F_fringes./norm;

    ind = find(F_fringes==max(F_fringes(:)));
    modulation(m) = 2*F_fringes(ind(1));
    modulation(m+1)=NaN;
end

plot([0:maximum_shift+1],modulation,'x')
axis([0 maximum_shift 0 1.1])
title(['Coherence index used: ' num2str(coherence_index)]);
xlabel('Shift between fields, in pixels')
ylabel('Fringe modulation')

x=find(modulation < mod_thr);
if isempty(x)
    disp('Minimum modulation value is:')
    disp(min(modulation))
    error('Either CohArea_upper_limit is too small or zero_threshold is too small')
else
    transverse_coherence_length = x(1)-2; %in pixels. Coherence area is the square of this. 
                                       % -1 since index 1 = 0 pixel shift,
                                       % and -1 so that last value, which
                                       % is outside defined coherence area,
                                       % is removed. This also means that
                                       % for the highly incoherent cases,
                                       % the transverse coherence length
                                       % (and hence coherence area) is 1
                                       % pixel (which we can interpret as <
                                       % 1 pixel.
                                       
    coh_area = transverse_coherence_length^2;
end

