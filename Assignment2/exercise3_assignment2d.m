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

img = rgb2gray(imread('museum.jpg'));

tMin = 10;
tMax = 30;
sigma = 1;

figure('name', '2D - optional');
subplot(2, 2, 1);
imagesc(img); colormap gray; title('Original');
subplot(2, 2, 2);
imagesc(findedges(img, sigma, tMax)); colormap gray; title('Thresholded (t = 30)');
subplot(2, 2, 3);
imagesc(findedges_supression(img, sigma, tMax)); colormap gray; title('Nonmaxima supp. (t=30)');
subplot(2, 2, 4);
imagesc(findedges_supression(img, sigma, tMin, tMax)); colormap gray; title('Hystersis (t_{min}=10, t_{max}=30)');
