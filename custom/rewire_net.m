% clear all;
load('MEP_data_1105.mat');
data_type = ["celegans_global"; "celegans_local"; "drosophila";...
    "mouse"; "macaque"; "human128"; "shmetro"; "USAir"];
for i = 1: 6
adj = data.(data_type(i)).adj;
adj = adj + adj'>0;
dis = data.(data_type(i)).dis;
[ent,dcen] = distance_entropy(adj, dis, 100);
disp(['ent:',num2str(ent)]);
ent_ran = 0;
for j = 1: 200
    tmp_adj_ran = randmio_und(adj, 10);
    [tmp_ent_ran,dcen] = distance_entropy(tmp_adj_ran, dis, dcen);
    if tmp_ent_ran > ent_ran
        disp(tmp_ent_ran);
        ent_ran = tmp_ent_ran;
        adj_ran = tmp_adj_ran;
%         save(['adj_ran_',num2str(i)],'adj_ran');
    end
    
end
data.(data_type(i)).adj_ran = adj_ran;
save('MEP_data_1106','data');
end