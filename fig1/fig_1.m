clear all;close all;


data_name = ["celegans_global"; "celegans_local"; "drosophila";"mouse";"macaque";"human128";];
data_inset_op = [1, 1, 0, 0, 0, 0, 1, 1, 1];
data_path = '../data/';
% scale = [1,1,1,1000,10000,10000]
% bin_num = [4,1,2203,40374,242013,2380591]
bin_num = [4, 1, 10, 20, 30, 15]
i=6
% for i = 4%1: 6
    load(strcat(data_path,'MEP_net_',data_name(i),'.mat'));
%     dis = dis %*scale(i);
i=6
for bin_ = 2%[3,5,7,9]
    [p, q, r, d] = optimize_pd(adj, dis, 15,1, data_inset_op(i),0,strcat(data_name(i),num2str(bin_)));
%     close all;
    
end
% end
% save('prl_fig1-a','p','q','d');
% close all

%  bar([p,q'])
 