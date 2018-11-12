function [Imag, Idir] = gradient_magnitude(I,sigma)
[Gx, Gy] = gradient(I);

Imag = hypot(Gx,Gy);
Idir = atan2(Gy,Gx)*180/pi; % Radians to degrees
end