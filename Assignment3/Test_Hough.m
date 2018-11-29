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

E = zeros(100);
E(1, 1) = 1; E(2, 2) = 1; E(3, 3) = 1;
E(7, 7) = 1; E(90, 90) = 1; E(9, 9) = 1;
E(40, 40) = 1; E(30, 30) = 1; E(20, 20) = 1;
E(50, 50) = 1; E(70, 70) = 1; E(100, 100) = 1;
[rho1, theta1] = hough_find_lines(E, 200, 200, 1);
hough_draw_lines(E, rho1, theta1);