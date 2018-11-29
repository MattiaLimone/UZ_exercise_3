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

E = zeros(100);
E(10, 10) = 1;
E(20, 20) = 1;
[rho1, theta1] = hough_find_lines(E, 400, 200, 5);

img2 = imread('rectangle.png');
edges2 = findedges_supression(rgb2gray(img2), 1, 1);
[rho2, theta2] = hough_find_lines(edges2, 300, 200, 4);
 
img3 = imread('rectangle.png');
edges3 = findedges_supression(rgb2gray(img3), 1, 5);
[rho3, theta3] = hough_find_lines(edges3, 300, 200, 6);
