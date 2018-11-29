function B = nonmaxima_suppression_box(A, N)
[h, w] = size(A);
B = zeros(size(A));
for i = 1:h
    for j = 1:w
        i_left = max([1, j - N]);
        i_right = min([w, j + N]);
        i_up = max([1, i - N]);
        i_down = min([h, i + N]);
        kernel = A(i_up:i_down, i_left:i_right);
        if(A(i, j) == max(max(kernel)))
            B(i, j) = A(i, j);
        end
    end
end
end