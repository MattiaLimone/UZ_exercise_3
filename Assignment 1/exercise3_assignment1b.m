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

k= 8;
sigma = 6.0;
[G_dx,x] = gaussdx(sigma);

impulse = zeros(25,25) ; impulse(13,13) = 255 ;
subplot(3,3,1);imagesc(impulse); colormap(gray); title('Impulse');
G1=fspecial('gauss',[round(k*sigma), round(k*sigma)], sigma);
[Gx,Gy] = gradient(G1);  
[Gxx,Gxy] = gradient(Gx);
[Gyx,Gyy] = gradient(Gxx);

Conv1 = conv2(impulse,Gy);
Conv2 = conv2(impulse,Gx);
Conv3 = conv2(impulse,G1);
Conv4 = conv2(impulse,Gx);
Conv5 = conv2(impulse,Gy);

subplot(3,3,2);imagesc(Conv1); colormap(gray);title('G,Dt');
subplot(3,3,3);imagesc(Conv2); colormap(gray);title('D,Gt');
subplot(3,3,4);imagesc(Conv3); colormap(gray);title('G,Gt');
subplot(3,3,5);imagesc(Conv4); colormap(gray);title('Gt,D');
subplot(3,3,6);imagesc(Conv5); colormap(gray);title('Dt,G');
