% Author: Mattia Limone - Miroslav Purkrabek
% Help of students of University of Salerno
% Change the current folder to m file oneif(~isdeployed)
	cd(fileparts(which(mfilename)));

clc;	% Clear command window.
clear;	% Delete all variables.
close all;	% Close all figure windows except those created by imtool.
imtool close all;	% Close all figure windows created by imtool.
workspace;	% Make sure the workspace panel is showing.

imgName = 'eclipse.jpg';
img = imread(imgName);
gray = rgb2gray(img);

noCircles = 24;
sigma = 1;
tMin = 2;
tMax = 5;
R = 48.5;

edges = findedges_supression(gray, sigma, tMin, tMax);
[x, y] = hough_find_circles(edges, 800, 800, R, noCircles);

figure('name', '3h - optional');
hough_draw_circles(img, y, x, R*ones(1, noCircles));
title(imgName);