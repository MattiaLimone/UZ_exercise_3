function result = remap(img)
[h, w] = size(img);
result = zeros(h, w);

for i = 1:h
    for j = 1:w
        if(img(i, j) > pi/2)
            % pi/2, pi
            result(i, j) = pi - img(i, j);
        elseif (img(i, j) < -pi/2)
            % -pi , -pi/2
            result(i, j) = pi + img(i, j);
        else
            % -pi/2, p/2
            result(i, j) = img(i, j);
        end
    end
end
end