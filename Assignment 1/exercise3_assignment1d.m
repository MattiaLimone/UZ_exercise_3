% Author: Mattia Limone
% Change the current folder to m file one
if(~isdeployed)
	cd(fileparts(which(mfilename)));
end
clc;	% Clear command window.
clear;	% Delete all variables.
close all;	% Close all figure windows except those created by imtool.
imtool close all;	% Close all figure windows created by imtool.
workspace;	% Make sure the workspace panel is showing.

% Best is chi2, big difference between different images, hellinger also
% good
% l2 and intersect return less distance
method = 'hellinger';
nBins = 8;

[database, files] = load_histogram_database('images', nBins);
distances = zeros(length(files), 1);
refImage = 20;
for i = 1:length(files)
    distances(i) = compare_histograms(database(refImage, :), database(i, :), method);
end
[distancesSorted, sortedIndexes] = sort(distances);

figure('Name', '1f');
subplot(2, 6, 1);
imshow(imread(files{sortedIndexes(1)}));
title(strcat('Image ', int2str(sortedIndexes(1))));
subplot(2, 6, 2);
imshow(imread(files{sortedIndexes(2)}));
title(strcat('Image ', int2str(sortedIndexes(2))));
subplot(2, 6, 3);
imshow(imread(files{sortedIndexes(3)}));
title(strcat('Image ', int2str(sortedIndexes(3))));
subplot(2, 6, 4);
imshow(imread(files{sortedIndexes(4)}));
title(strcat('Image ', int2str(sortedIndexes(4))));
subplot(2, 6, 5);
imshow(imread(files{sortedIndexes(5)}));
title(strcat('Image ', int2str(sortedIndexes(5))));
subplot(2, 6, 6);
imshow(imread(files{sortedIndexes(6)}));
title(strcat('Image ', int2str(sortedIndexes(6))));

prec = 2;
subplot(2, 6, 7);
bar(database(sortedIndexes(1), :));
title(strcat(method, '=', num2str(distancesSorted(1), prec)));
subplot(2, 6, 8);
bar(database(sortedIndexes(2), :));
title(strcat(method, '=', num2str(distancesSorted(2), prec)));
subplot(2, 6, 9);
bar(database(sortedIndexes(3), :));
title(strcat(method, '=', num2str(distancesSorted(3), prec)));
subplot(2, 6, 10);
bar(database(sortedIndexes(4), :));
title(strcat(method, '=', num2str(distancesSorted(4), prec)));
subplot(2, 6, 11);
bar(database(sortedIndexes(5), :));
title(strcat(method, '=', num2str(distancesSorted(5), prec)));
subplot(2, 6, 12);
bar(database(sortedIndexes(6), :));
title(strcat(method, '=', num2str(distancesSorted(6), prec)));
