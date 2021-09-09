clear all;clc;
load('../data/MEP_data_1106.mat');
data_type = ["celegans_global"; "celegans_local"; "drosophila";...
    "mouse"; "macaque"; "human128"; "shmetro"; "USAir"];
count = 1;
% load('ran_id');
for i =[3:6,1:2]
    
    adj = data.(data_type(i)).adj;
    adj = adj + adj'>0;
    dis = data.(data_type(i)).dis;
%     adj_reg = data.(data_type(i)).adj_reg;
    adj_ran = data.(data_type(i)).adj_ran;
    edge_num = sum(sum(adj));
    [sorted_dis,~] = sort(dis(dis>0),'ascend');
    
    adj_reg = dis <= sorted_dis(floor(edge_num ));
    adj_reg = adj_reg-diag(diag(adj_reg));
    disp([num2str(sum(sum(adj))),', ',num2str(sum(sum(adj_reg)))]);
    [ent(count),dcen] = distance_entropy(adj, dis, 100);
    ent(count)
    [ent_ran(count),dcen] = distance_entropy(adj_ran, dis, dcen);
    [ent_reg(count),dcen] = distance_entropy(adj_reg, dis, dcen);
    data.(data_type(i)).adj_reg = adj_reg;
    count = count +1;
end
bar([ent_ran;ent;ent_reg]');
xticks([1:6]);
xticklabels({'Drosophila','Mouse','Macaque','Human','C elegans global','C elegans local'});