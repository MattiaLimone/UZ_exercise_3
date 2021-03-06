function d = compare_histograms( h1, h2, dist_name)
% Images h1 and h2 have to be vectors
switch dist_name
    case 'l2'
        d = sqrt(sum((h1 - h2).^ 2));
    case 'chi2'
        epsilon = 1e-10;
        d = sum(((h1 - h2) .^ 2)./(h1 + h2 + epsilon))/2;
    case 'hellinger'
        d = sqrt(sum((sqrt(h1) - sqrt(h2)).^2)/2);
    case 'intersect'
        d = 1 - sum(min(h1, h2));
    otherwise
        error('Unknown distance type!'); % This is how you throw an exception.
end