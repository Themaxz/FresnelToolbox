close all
clear all

flat = imread('jeff.jpg');
M = 7; % size of box to put into image
mu = 75; % size of microlens square
offsetX = 5; % x axis offset
offsetY = 25; % y axis offset

[height, width, depth] = size(flat); % size of image

% Nx, Ny - Number of microlens images
Ny = floor(height / mu);
Nx = floor(width / mu);
P = M;

output = zeros(Ny*M, Nx*M, 3); %set up size of output image

for boxY = 1:Ny
    for boxX = 1:Nx
        startY = ((boxY-1) * mu) + 1 + floor((mu - M) / 2) + offsetY;
        endY = startY + M - 1;
        startX = ((boxX-1) * mu) + 1 + floor((mu - M) / 2) + offsetX;
        endX = startX + M - 1;

        startYOutput = ((boxY-1)*M) + 1;
        endYOutput = startYOutput + M - 1;
        startXOutput = ((boxX-1)*M) + 1;
        endXOutput = startXOutput + M - 1;

        output(startYOutput:endYOutput, startXOutput:endXOutput, :) = flat(endY:-1:startY, endX:-1:startX, :);
    end
end

figure, imagesc(output ./ max(output(:)));

