function norm_loc = normalize_location(loc)

num_node = size(loc, 1);
dim = size(loc, 2);

norm_loc = loc;
for i = 1: dim
    max_loc = max(norm_loc(:, i));
    min_loc = min(norm_loc(:, i));
    norm_loc(:, i) = (norm_loc(:, i) - min_loc)/(max_loc - min_loc);
end