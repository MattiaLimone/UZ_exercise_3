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
sigma = 1.0;

[Ix, Iy] = image_derivatives(img, sigma);
[Ixx, Iyy, Ixy] = image_derivatives2(img, sigma);
[Imag, Idir] = gradient_magnitude(img, sigma);

figure('name', '1C');
subplot(2, 4, 1);
imagesc(img); colormap gray;
title 'Original';

subplot(2, 4, 2);
imagesc(Ix); colormap gray;
title 'I_x';

[Gmag, Gdir] = imgradient(img);
subplot(2, 4, 3);
imagesc(Iy); colormap gray;
title 'I_y';

subplot(2, 4, 5);
imagesc(Ixx); colormap gray;
title 'I_{xx}';

subplot(2, 4, 6);
imagesc(Ixy); colormap gray;
title 'I_{xy}';

subplot(2, 4, 7);
imagesc(Iyy); colormap gray;
title 'I_{yy}';

subplot(2, 4, 4);
imagesc(Imag); colormap gray;
title 'I_{mag}';

subplot(2, 4, 8);
imagesc(Idir); colormap gray;
title 'I_{dir}';