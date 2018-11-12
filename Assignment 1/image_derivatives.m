function [Ix, Iy] = image_derivatives(I, sigma)
% Assuming image is in grayscale
[Ix, Iy] = gradient(I); 
end