function [rate] = recover_rate(adj, adj_true)
% INPUT: adj, adj_true
% OUTPU: rate
adj = adj + adj'>0;
adj = reshape(adj, [prod(size(adj)), 1]);
adj_true = adj_true + adj_true'>0;
adj_true = reshape(adj_true, [prod(size(adj_true)), 1]);

TP = sum((adj == 1)&(adj_true == 1));
TN = sum((adj == 0)&(adj_true == 0));
FP = sum((adj == 1)&(adj_true == 0));
FN = sum((adj == 0)&(adj_true == 1));
total = TP + TN + FP + FN;
TP = TP/total;
TN = TN/total;
FP = FP/total;
FN = FN/total;
rate = TP/sum(TP + FN);
% disp([TP, TN, FP, FN, rate]);