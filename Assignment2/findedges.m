function [Ie] = findedges(img, sigma, theta)
[Ie, ~] = gradient_magnitude(img, sigma);
Ie = Ie >= theta;
end