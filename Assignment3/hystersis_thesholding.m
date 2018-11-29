function result = hystersis_thesholding(img, tMin, tMax)
imgMin = img >= tMin;
imgMax = img >= tMax;

imgMinLabeled = bwlabel(imgMin);

minLabels = unique(imgMinLabeled);
result = imgMax;
for i = 2:length(minLabels)
    [labeledX, labeledY] = find(imgMinLabeled == minLabels(i));
    inMax = zeros(length(labeledX));
    for j = 1:length(labeledX)
        inMax(j) = imgMax(labeledX(j), labeledY(j));
    end
    if any(any(inMax))
        for j = 1:length(labeledX)
            result(labeledX(j), labeledY(j)) = 1;
        end
    end
end
end