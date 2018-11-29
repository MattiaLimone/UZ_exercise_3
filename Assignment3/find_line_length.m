function dist = find_line_length(rho, theta, h, w)
phi = 0:0.001:2*pi;
p = rho ./ cos(theta - phi);
yt = p .* sin(phi);
y = yt(yt > 0 & yt <= h);
p = p(yt > 0 & yt <= h);
phi = phi(yt > 0 & yt <= h);

x = p .* cos(phi);
x = x(x > 0 & x <= w);
y0 = min(y);
y1 = max(y);
x0 = min(x);
x1 = max(x);
if length(y1) <= 0 || length(y0) <= 0 || length(x0) <= 0 || length(x1) <= 0
    dist = 1e10;
else
    y1 = y1(1);
    y0 = y0(1);
    x0 = x0(1);
    x1 = x1(1);
    
    dist = sqrt((y0 - y1)^2 + (x0 - x1)^2);
end
end
