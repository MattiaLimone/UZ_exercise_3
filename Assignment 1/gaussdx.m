function [g, x] = gaussdx(sigma)
x = -round(3.0*sigma):round(3.0*sigma);
g = -(exp(- x.^2 /(2*sigma^2)) .* x) / (sqrt(pi*2)*sigma); 
% Calculate Gaussian kernel derivative for values of x
g = g / sum(g) ; % normalisation
end