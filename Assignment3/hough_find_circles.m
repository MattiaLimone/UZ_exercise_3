function [outX, outY] = hough_find_circles(img, binsX, binsY, R, nCircles)
[h, w] = size(img);
yValues = linspace(1, w, binsY); % Values of width Y
xValues = linspace(1, h, binsX); % Values of heigh X

A = zeros(binsX, binsY); % Accumulator matrix, (x, y)

[x0, y0] = find(img); % Find edge points = centers of circles
for j = 1:length(x0) % Iterate all edge points
    y = y0(j)-R:y0(j)+R; % All possible Ys for this center
    yBin = round((y/w) * (binsY-1)) + 1;
    for i = 1:length(y) % Itterate all Ys
        % Positive square root
        x = sqrt(R^2 - (y(i) - y0(j))^2) + x0(j);
        xBin = round(x/h * (binsX-1)) + 1;
        if xBin > 0 && xBin <= binsX && yBin(i) > 0 && yBin(i) <= binsY% Mandatory out-of-bounds check
            A(xBin, yBin(i)) = A(xBin, yBin(i)) + 1;
        end
        % Negative square root
        x = - sqrt(R^2 - (y(i) - y0(j))^2) + x0(j);
        xBin = round(x/h * (binsX-1)) + 1;
        if xBin > 0 && xBin <= binsX && yBin(i) > 0 && yBin(i) <= binsY% Mandatory out-of-bounds check
            A(xBin, yBin(i)) = A(xBin, yBin(i)) + 1;
        end
    end
end
   

figure('name', 'Hough space');
imagesc(A);
A = nonmaxima_suppression_box(A, 20);

[rows,cols] = ndgrid(1:size(A,1),1:size(A,2));
[~, idx] = sort(A(:), 'descend');
idxSorted = [rows(idx), cols(idx)];

xIndexes = idxSorted(1:nCircles, 1);
yIndexes = idxSorted(1:nCircles, 2);

outX = xValues(xIndexes); % Get values
outY = yValues(yIndexes);
end