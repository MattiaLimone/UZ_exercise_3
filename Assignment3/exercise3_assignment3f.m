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

bricks = imread('bricks.jpg');
pier = imread('pier.jpg');
bricksGray = rgb2gray(bricks);
pierGray = rgb2gray(pier);
noLines = 10;
sigma = 5;
tMin = 5;
tMax = 10;

edgesBricks = findedges_supression(bricksGray, sigma, tMin, tMax);
edgesPier = findedges_supression(pierGray, 5, tMin, tMax);

figure('name', 'edges');
subplot(1, 2, 1);
imagesc(edgesBricks); colormap gray;
subplot(1, 2, 2);
imagesc(edgesPier); colormap gray;

[rhoBricks, thetaBricks] = hough_find_lines(edgesBricks, 800, 200, noLines);
[rhoPier, thetaPier] = hough_find_lines(edgesPier, 800, 200, noLines);

figure('name', '3f');
subplot(1, 2, 1);
hough_draw_lines(bricks, rhoBricks, thetaBricks);
title('Bricks');
subplot(1, 2, 2);
hough_draw_lines(pier, rhoPier, thetaPier);
title('Pier');