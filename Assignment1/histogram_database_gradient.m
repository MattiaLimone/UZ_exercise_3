function [histograms, files] = histogram_database_gradient(directory, bins)
files = cell(30 * 4, 1); % We will use cell array to store filenames
% initialize matrix for histograms
histograms = zeros(30 * 4, bins^2);
% calculate histogram for each image
for i = 1:30 % Iterate objects
    for j = 1:4 % Iterate orientations
        image = (i-1) * 4 + j;
        files{image} = fullfile(directory, sprintf('object_%02d_%d.png', i, j));
        img = imread(files{image});
        hist = myhist3_gradient(rgb2gray(img), bins);
        histograms(image, :) = hist(:);
    end
end