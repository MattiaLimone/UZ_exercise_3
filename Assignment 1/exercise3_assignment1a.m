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

k= 15;
sigma= 3;
G1=fspecial('gauss',[round(k*sigma), round(k*sigma)], sigma);
G1 = gaussian2d(k,sigma);
[Gx,Gy] = gradient(G1);  
[Gxx,Gxy] = gradient(Gx);
[Gyx,Gyy] = gradient(Gy);
surf(Gxy)