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

image = double(rgb2gray(imread('museum.jpg')));
sigma = 3;
[Ix, Iy] = image_derivatives(image,sigma);
[Imag, Idir] = gradient_magnitude(image,sigma);
[Ixx, Iyy, Ixy] = image_derivatives2(image, sigma);

subplot(2,4,1);imshow(uint8(image)); title('Original'); 
subplot(2,4,2);imagesc(Ix); colormap(gray); title('Ix'); truesize;
subplot(2,4,3);imagesc(Iy); colormap(gray); title('Iy'); truesize;
subplot(2,4,4);imagesc(Imag); colormap(gray); title('Imag'); truesize;
subplot(2,4,5);imagesc(Ixx); colormap(gray); title('Ixx'); truesize;
subplot(2,4,6);imagesc(Ixx); colormap(gray); title('Ixy'); truesize;
subplot(2,4,7);imagesc(Iyy); colormap(gray); title('Iyy'); truesize;
subplot(2,4,8);imagesc(Idir); colormap(gray); title('Idir'); truesize;