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

theta = 2:3:14;
sigma = 1;
figure('name', '2b');
subplot(2, 3, 1);
imagesc(img); colormap gray;
title('Original');
j = 2;
for i = theta
    subplot(2, 3, j);
    imagesc(findedges(img, sigma, i)); colormap gray;
    title(strcat('Theta=',num2str(i)));
    j = j+1;
end