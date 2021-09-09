function loc = dis2loc(dis, m)

n = size(dis, 1);
dis2 = dis.^2;
M = zeros(n);
for i = 1: n
    for j = 1:n
        M(i, j) = .5* (dis2(1, j) + dis2(i, 1) - dis2(i, j));
    end
end
[D, V] = eig(M);

% V(find(V<0.1)) = 0;
loc = D*sqrt(V);
loc = loc(:, end - m + 1: end);
% loc = M;