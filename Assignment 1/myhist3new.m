function H = myhist3new(img, bins)
% when computing cell indices add a small factor to avoid overflow
% problems
idx = floor(double(img) * bins / (255 + 1e-5)) + 1;
H = zeros(bins,bins,bins);
% increment the appropriate cell of the H(R,G,B) for each pixel in the image

idx2 = reshape(idx,[],3);

H = accumarray(idx2,1);

% normalize the histogram (sum of cell values should equal to 1)
H = H / sum(sum(sum(H)));
end