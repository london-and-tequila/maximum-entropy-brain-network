function d_matrix = distance_matrix(position)
n = size(position,1);
d_matrix = zeros(n);
for i = 1:n
    for j = 1:n
        d_matrix(i,j) = sqrt(sum((position(i,:)-position(j,:)).^2));
    end
end