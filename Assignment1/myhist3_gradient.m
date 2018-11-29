function H = myhist3_gradient(img, bins)
[Imag, Idir] = gradient_magnitude(img, 1); %calculate gradient
Idir = floor((Idir + pi) * bins / (2*pi + 1e-5)) + 1; %calculate direction

Idir = reshape(Idir, [], 8); % Resize for accumarray function
Imag = reshape(Imag, [], 8);
H = zeros(bins, bins);
for i = 1:bins
    H(i, :) = accumarray(Idir(:, i), Imag(:, i), [8 1]);
end
H = H / sum(sum(H)); % normalize the histogram
end