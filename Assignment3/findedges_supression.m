function [Ie] = findedges_supression(img, sigma, tMin, tMax)
[Ie, Idir] = gradient_magnitude(img, sigma);
Ie = nonmaxima_suppression_line(Ie, Idir);

switch nargin
    case 3
        Ie = Ie >= tMin;
    case 4
        Ie = hystersis_thesholding(Ie, tMin, tMax);
    otherwise
end
end