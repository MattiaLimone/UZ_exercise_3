function [outRho, outTheta, votes] = hough_find_lines_angle(img, Idir, binsRho, binsTheta, nLines)
thetaValues = linspace(-90, 90, binsTheta) / 180 * pi; % Values of theta in radians
D = ceil(sqrt(size(img, 1)^2 + size(img, 2)^2)); % Diagonal of image (rounded up)
rhoValues = linspace(-D, D, binsRho); % Values of rho

A = zeros(binsRho, binsTheta); % Accumulator matrix, (RHO, THETA)

[x, y] = find(img);
%taken from%
%https://it.mathworks.com/matlabcentral/fileexchange/54404-remap-numerical-values%
Idir = remap(Idir); % Transform Idir from -pi, pi to -pi/2, pi/2
Idir = round(((Idir + pi/2) / pi) * (binsTheta-1)) + 1;
for j = 1:length(x) % Iterate all edge points
    thetaBin = Idir(x(j), y(j));
        rho = y(j) * cos(thetaValues(thetaBin)) + x(j) * sin(thetaValues(thetaBin));
        rhoBin = round(((rho + D) / (2 * D + 1e-5)) * binsRho);
        if rhoBin > 0 && rhoBin <= binsRho % Mandatory out-of-bounds check
            A(rhoBin, thetaBin) = A(rhoBin, thetaBin) + 1;
        end
end

figure('name', 'Hough space');
imagesc(A);

A = nonmaxima_suppression_box(A, 5);

[rows,cols] = ndgrid(1:size(A,1),1:size(A,2));
[votes, idx] = sort(A(:), 'descend');
idxSorted = [rows(idx), cols(idx)];

rhoIndexes = idxSorted(1:nLines, 1);
thetaIndexes = idxSorted(1:nLines, 2);

outRho = rhoValues(rhoIndexes); % Get values
outTheta = pi/2 - thetaValues(thetaIndexes);
votes = votes(1:nLines);
end