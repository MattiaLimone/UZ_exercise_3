function [outRho, outTheta, votes] = hough_find_lines(img, binsRho, binsTheta, nLines, norm)
thetaValues = linspace(-90, 90, binsTheta) / 180 * pi; % Values of theta in radians
D = ceil(sqrt(size(img, 1)^2 + size(img, 2)^2)); % Diagonal of image (rounded up)
rhoValues = linspace(-D, D, binsRho); % Values of rho

A = zeros(binsRho, binsTheta); % Accumulator matrix, (RHO, THETA)

[x, y] = find(img);
rho = y * cos(thetaValues) + x * sin(thetaValues); % compute rho for all theta
rho = round(((rho + D) / (2 * D)) * length(rhoValues)); % Sort rho into bins
for j = 1:length(x) % Iterate all edge points
    for i = 1:binsTheta % All thetas for each edge point
        if rho(j, i) > 0 && rho(j, i) <= binsRho % Mandatory out-of-bounds check
            A(rho(j, i), i) = A(rho(j, i), i) + 1;
        end
    end
end

figure('name', 'Hough space');
imagesc(A);

[hX, hY] = find(A);

if nargin > 4 && norm
    for i = 1:length(hX)
        len = find_line_length(rhoValues(hX(i)), thetaValues(hY(i)), size(img, 1), size(img, 2));
        A(hX(i), hY(i)) = A(hX(i), hY(i)) / len;
    end
end

A = nonmaxima_suppression_box(A, 3);

[rows,cols] = ndgrid(1:size(A,1),1:size(A,2));
[A, idx] = sort(A(:), 'descend');
idxSorted = [rows(idx), cols(idx)];

rhoIndexes = idxSorted(1:nLines, 1);
thetaIndexes = idxSorted(1:nLines, 2);

outRho = rhoValues(rhoIndexes); % Get values
outTheta = thetaValues(thetaIndexes);
votes = A(1:nLines);
end