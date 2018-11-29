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

imgName = 'pier.jpg';
img = imread(imgName);
gray = rgb2gray(img);
noLines = 4;
sigma = 1;

edges = findedges_supression(gray, sigma, 5);
[~, Idir] = gradient_magnitude(gray, sigma);
[rho, theta, votes] = hough_find_lines_angle(edges, Idir, 800, 200, noLines);

figure('name', '3g - optional');
hough_draw_lines(img, rho, pi/2 - theta);
title(imgName);