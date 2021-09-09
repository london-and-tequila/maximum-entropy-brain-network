function [entropy2, dcen] = distance_entropy(link_matrix, d_matrix,bin_num)
d = full(link_matrix).*d_matrix;
d = reshape(d(find(d>0)), [prod(size(d(find(d>0)))), 1]);
% bins = linspace(min(min(d_matrix)),max(max(d_matrix)),bin_num);
[N, dcen] = hist(d, bin_num);
p = N/double(sum(N));
entropy2 = sum(-p(find(p>0)).*log(p(find(p>0))));

