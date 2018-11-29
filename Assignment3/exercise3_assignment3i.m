% Author: Mattia Limone - Miroslav Purkrabek 
% Help of students of University of Salerno/n
% Change the current folder to m file oneif(~isdeployed)
	cd(fileparts(which(mfilename)));

clc;	% Clear command window.
clear;	% Delete all variables.
close all;	% Close all figure windows except those created by imtool.
imtool close all;	% Close all figure windows created by imtool.
workspace;	% Make sure the workspace panel is showing.

imgName = 'dashedLine.png';
img = imread(imgName);
gray = rgb2gray(img);

noLines = 5;
sigma = 5;

edges = findedges_supression(gray, sigma, 5, 10);
figure; imagesc(edges);

[rho1, theta1, A1] = hough_find_lines(edges, 600, 200, noLines, false);
[rho2, theta2, A2] = hough_find_lines(edges, 600, 200, noLines, true);

figure('name', '3i - optional');
subplot(1, 2, 1);
hough_draw_lines(img, rho1(1), theta1(1));
title('Without normalization');
subplot(1, 2, 2);
hough_draw_lines(img, rho2(1), theta2(1));
title('With normalization');