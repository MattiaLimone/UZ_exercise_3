function [Ixx, Iyy, Ixy] = image_derivatives2(I, sigma)
[Gx,Gy] = gradient(I);  
[Ixx,Ixy] = gradient(Gx);
[Iyx,Iyy] = gradient(Gy);
end