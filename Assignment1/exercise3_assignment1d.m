% Author: Mattia Limone - Miroslav Purkrabek 
% Help of students of University of Salerno/n
% Change the current folder to m file oneif(~isdeployed)
	cd(fileparts(which(mfilename)));
end
clc;	% Clear command window.
clear;	% Delete all variables.
close all;	% Close all figure windows except those created by imtool.
imtool close all;	% Close all figure windows created by imtool.
workspace;	% Make sure the workspace panel is showing.

method = 'chi2';
nBins = 8;

[database, files] = histogram_database_gradient('images', nBins);
distances = zeros(length(files), 1);
refImage = 1;
for i = 1:length(files)
    distances(i) = compare_histograms(database(refImage, :), database(i, :), method);
end
[distancesSorted, sortedIndexes] = sort(distances);

figure('name', '1D');

prec = 2;
images = 6;
for i = 1:images
    subplot(2, images, i);
    imshow(imread(files{sortedIndexes(i)}));
    title(strcat('Image ', int2str(sortedIndexes(i))));
end

for i = 1:images
    subplot(2, images, images+i);
    bar(database(sortedIndexes(i), :));
    title(strcat(method, '=', num2str(distancesSorted(i), prec)));
end