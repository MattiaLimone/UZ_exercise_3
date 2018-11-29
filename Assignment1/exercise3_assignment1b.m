% Author: Mattia Limone - Miroslav Purkrabek - 
% Help of students of University of Salerno
% Change the current folder to m file one
if(~isdeployed)
	cd(fileparts(which(mfilename)));
end
clc;	% Clear command window.
clear;	% Delete all variables.
close all;	% Close all figure windows except those created by imtool.
imtool close all;	% Close all figure windows created by imtool.
workspace;	% Make sure the workspace panel is showing.

sigma = 6.0;
G = gauss(sigma);
D = gaussdx(sigma);

impulse = zeros(25,25);
impulse(13,13) = 255;
ggT = conv2(G.', conv2(G, impulse));
gdT = conv2(D.', conv2(G, impulse));
dgT = conv2(G.', conv2(D, impulse));
gTd = conv2(D, conv2(G.', impulse));
dTg = conv2(G, conv2(D.', impulse));

figure('name', '1b');

subplot(2, 3, 1);
imagesc(impulse); colormap gray;
title 'Impulse';

subplot(2, 3, 4);
imagesc(ggT); colormap gray;
title 'G, Gt';

subplot(2, 3, 2);
imagesc(gdT); colormap gray;
title 'G, Dt';

subplot(2, 3, 5);
imagesc(gTd); colormap gray;
title 'Gt, D';

subplot(2, 3, 3);
imagesc(dgT); colormap gray;
title 'D, Gt';

subplot(2, 3, 6);
imagesc(dTg); colormap gray;
title 'Dt, G';