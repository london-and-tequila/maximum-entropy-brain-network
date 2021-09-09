clear all;
clc;
load("MEP_data_1013.mat");

data_type = ["drosophila";...
    "mouse"; "macaque"; "human128";"celegans_global"; "celegans_local";  "shmetro"; "USAir"];

for i = 1: 6
    adj_true = data.(data_type(i)).adj + data.(data_type(i)).adj'>0;
    adj_ran = data.(data_type(i)).adj_ran;
    adj_pure_ran = data.(data_type(i)).adj_ER;
    adj_pred = data.(data_type(i)).adj_MEP;
    adj_H = data.(data_type(i)).adj_H;
    adj_d = data.(data_type(i)).adj_d;
%     [~,~,ks_bc_pred(i)] = kstest2(betweenness_wei(adj_true),betweenness_wei(adj_pred));
%     [~,~,ks_bc_ran(i)] = kstest2(betweenness_wei(adj_true),betweenness_wei(adj_ran));
%     [~,~,ks_bc_pure_ran(i)] = kstest2(betweenness_wei(adj_true),betweenness_wei(adj_pure_ran));
%     [~,~,ks_bc_H(i)] = kstest2(betweenness_wei(adj_true),betweenness_wei(adj_H));
%     [~,~,ks_bc_d(i)] = kstest2(betweenness_wei(adj_true),betweenness_wei(adj_d));
    dis = data.(data_type(i)).dis;
    con_dis_true = (adj_true>0).*dis;
    [p_true, dcen] = hist(con_dis_true(find(con_dis_true>0)), 200);
    con_dis_pred = adj_pred.*dis;
    [p_pred, dcen] = hist(con_dis_pred(find(con_dis_pred>0)), dcen);
    con_dis_ran = adj_ran.*dis;
    [p_ran, dcen] = hist(con_dis_ran(find(con_dis_ran>0)), dcen);
    con_dis_pure_ran = adj_pure_ran.*dis;
    [p_pure_ran, dcen] = hist(con_dis_pure_ran(find(con_dis_pure_ran>0)), dcen);
    con_dis_H = adj_H.*dis;
    [p_H, dcen] = hist(con_dis_H(find(con_dis_H>0)), dcen);
    con_dis_d = adj_d.*dis;
    [p_d, dcen] = hist(con_dis_d(find(con_dis_d>0)), dcen);
    [~, ~, ks_pd_pred(i)] = kstest2(con_dis_true(find(con_dis_true>0)), con_dis_pred(find(con_dis_pred>0)));
    [~, ~, ks_pd_ran(i)] = kstest2(con_dis_true(find(con_dis_true>0)), con_dis_ran(find(con_dis_ran>0)));
    [~, ~, ks_pd_d(i)] = kstest2(con_dis_true(find(con_dis_true>0)), con_dis_d(find(con_dis_d>0)));
    [~, ~, ks_pd_H(i)] = kstest2(con_dis_true(find(con_dis_true>0)), con_dis_H(find(con_dis_H>0)));
    [~, ~, ks_pd_pure_ran(i)] = kstest2(con_dis_true(find(con_dis_true>0)), con_dis_pure_ran(find(con_dis_pure_ran>0)));

%     ASP_true(i) = ave_path_length(adj_true);
%     ASP_pred(i) = ave_path_length(adj_pred);
%     ASP_ran(i) = ave_path_length(adj_ran);
%     ASP_pure_ran(i) = ave_path_length(adj_pure_ran);
%     ASP_H(i) = ave_path_length(adj_H);
%     ASP_d(i) = ave_path_length(adj_d);
    
%     k_pred(i) = KLDiv(p_pred(find(p_true>0)),p_true(find(p_true>0)));
%     k_ran(i) = KLDiv(p_ran(find(p_true>0)),p_true(find(p_true>0)));
%     k_pure_ran(i) = KLDiv(p_pure_ran(find(p_true>0)),p_true(find(p_true>0)));
%     k_H(i) = KLDiv(p_H(find(p_true>0)),p_true(find(p_true>0)));
%     k_d(i) = KLDiv(p_d(find(p_true>0)),p_true(find(p_true>0)));
%     
%     SP_true = distances(graph(adj_true.*dis));
%     SP_pred= distances(graph(adj_pred.*dis));
%     SP_ran = distances(graph(adj_ran.*dis));
%     SP_pure_ran = distances(graph(adj_pure_ran.*dis));
%     SP_H= distances(graph(adj_H.*dis));
%     SP_d = distances(graph(adj_d.*dis));
%     
%     [~, ~, ks_SP_pred(i)] = kstest2(SP_true(find(SP_true>0)), SP_pred(find(SP_pred>0)));
%     [~, ~, ks_SP_ran(i)] = kstest2(SP_true(find(SP_true>0)), SP_ran(find(SP_ran>0)));
%     [~, ~, ks_SP_pure_ran(i)] = kstest2(SP_true(find(SP_true>0)), SP_pure_ran(find(SP_pure_ran>0)));
%     [~, ~, ks_SP_H(i)] = kstest2(SP_true(find(SP_true>0)), SP_H(find(SP_H>0)));
%     [~, ~, ks_SP_d(i)] = kstest2(SP_true(find(SP_true>0)), SP_d(find(SP_d>0)));
    
    r_pred(i) = recover_rate(adj_true, adj_pred);
    r_ran(i) = recover_rate(adj_true, adj_ran);
    r_pure_ran(i) = recover_rate(adj_true, adj_pure_ran);
    r_H(i) = recover_rate(adj_true, adj_H);
    r_d(i) = recover_rate(adj_true, adj_d);
%     
    CC_true(i) =clust_coeff(adj_true);
    CC_pred(i) = clust_coeff(adj_pred);
    CC_ran(i) = clust_coeff(adj_ran);
    CC_pure_ran(i) = clust_coeff(adj_pure_ran);
    CC_H(i) = clust_coeff(adj_H);
    CC_d(i) = clust_coeff(adj_d);
%     [~, ~, clustcoeff_true] =  clutering_coef_bu(adj_true);
%     [~, ~, clustcoeff_pred] =  clutering_coef_bu(adj_pred);
%     [~, ~, clustcoeff_ran] =  clutering_coef_bu(adj_ran);
%     [~, ~, clustcoeff_pure_ran] =  clutering_coef_bu(adj_pure_ran);
%     [~, ~, clustcoeff_H] =  clutering_coef_bu(adj_H);
%     [~, ~, clustcoeff_d] =  clutering_coef_bu(adj_d);
%     [~, ~, ks_clustcoeff_pred(i)] = kstest2(clustcoeff_true, clustcoeff_pred);
%     [~, ~, ks_clustcoeff_ran(i)] = kstest2(clustcoeff_true, clustcoeff_ran);
%     [~, ~, ks_clustcoeff_pure_ran(i)] = kstest2(clustcoeff_true, clustcoeff_pure_ran);
%     [~, ~, ks_clustcoeff_H(i)] = kstest2(clustcoeff_true, clustcoeff_H);
%     [~, ~, ks_clustcoeff_d(i)] = kstest2(clustcoeff_true, clustcoeff_d);

        
    [Ci, Q_true(i)] = modularity_und(adj_true);
    [Ci, Q_pred(i)] = modularity_und(adj_pred);
    [Ci, Q_ran(i)] = modularity_und(adj_ran);
    [Ci, Q_pure_ran(i)] = modularity_und(adj_pure_ran);
    [Ci, Q_H(i)] = modularity_und(adj_H);
    [Ci, Q_d(i)] = modularity_und(adj_d);
    
end
figure(1);
set(gcf,'Units','Normalized','OuterPosition',[0.,0.3,.6,.6]);
subplot(2,2,2)
color = brewermap(3,'GnBu');
b1 = bar([ks_pd_pred; ks_pd_ran; ks_pd_pure_ran]');
% b1 = bar([ks_pd_pred; ks_pd_d; ks_pd_H; ks_pd_ran; ks_pd_pure_ran]');
% b1(1).EdgeColor = 'none';
% b1(2).EdgeColor = 'none';
% b1(3).EdgeColor = 'none';
% b1(4).EdgeColor = 'none';
% b1(5).EdgeColor = 'none';
b1(1).FaceColor = color(1,:);
b1(2).FaceColor = color(2,:);
b1(3).FaceColor = color(3,:);
% b1(4).FaceColor = [100, 255, 255]/255;
% b1(5).FaceColor = [100, 100, 255]/255;
% % xticklabels();
% 
% my_xticklabels(gca,1:6,{'Drosophila','Mouse','Macaque','Human',{'C elegans','global'},{'C elegans',' local'}},.01);
% xtickangle(15);
% set(gca,'xtick', 1:6, 'XTickLabel', {'Drosophila','Mouse','Macaque','Human','C elegans global','C elegans local'});
% my_xticklabels(1:6,{'Drosophila','Mouse','Macaque','Human',{'C elegans','global'},{'C elegans','local'}},'Rotation',30);
xticks([1:6]);xticklabels( {'Drosophila','Mouse','Macaque','Human', 'C elegans global' , 'C elegans local'} )

% fix_xticklabels(gca, 1, {'FontSize',12});
ylabel('KS_{wiring length}');
t = text(-0.1,1.15,'B','Units', 'Normalized', 'VerticalAlignment', 'Top');

% t.FontSize = 18;ax = gca;
% ax.FontSize = 12;
% % saveas(1,'a-2','epsc');
% 
% 
% % figure(2);
% % set(gcf,'Units','Normalized','OuterPosition',[0.,0.4,.3,.3]);
subplot(2,2,1)
b2 = bar(1-[r_pred; r_ran;r_pure_ran]');
% b2 = bar([r_pred; r_d; r_H; r_ran;r_pure_ran]');
% b2(1).EdgeColor = 'none';
% b2(2).EdgeColor = 'none';
% b2(3).EdgeColor = 'none';
% b2(4).EdgeColor = 'none';
% b2(5).EdgeColor = 'none';
b2(1).FaceColor = color(1,:);
b2(2).FaceColor = color(2,:);
b2(3).FaceColor = color(3,:);
% % % b2(4).FaceColor = [100, 255, 255]/255;
% % % b2(5).FaceColor = [100, 100, 255]/255;
% my_xticklabels(1:6,{'Drosophila','Mouse','Macaque','Human',{'C elegans','global'},{'C elegans','local'}},'Rotation',30);
xticks([1:6]);xticklabels({'Drosophila','Mouse','Macaque','Human', 'C elegans global' , 'C elegans local' })

legend('entropy-cost-degree', 'degree-constrained','degree-free');

xtickangle(15);
ylabel('recovery error rate');
t = text(-0.1,1.15,'A','Units', 'Normalized', 'VerticalAlignment', 'Top');
% t.FontSize = 18;
ax = gca;
% ax.FontSize = 12;
ylim([0,1.3])
% % % saveas(2,'c-2','epsc');
% % % saveas(2,convertStringsToChars(strcat(path_fig,"rate")),'epsc');
% 
% % figure(3);
% % set(gcf,'Units','Normalized','OuterPosition',[0.5,0.7,.3,.3]);
subplot(2,2,3);
b3 = bar(abs([1-CC_pred./CC_true;1-  CC_ran./CC_true;1-CC_pure_ran./CC_true]'));
% b3 = bar([CC_pred./CC_true; CC_d./CC_true; CC_H./CC_true;CC_ran./CC_true;CC_pure_ran./CC_true]');
% b3(1).EdgeColor = 'none';
% b3(2).EdgeColor = 'none';
% b3(3).EdgeColor = 'none';
% b3(4).EdgeColor = 'none';
% b3(5).EdgeColor = 'none';
b3(1).FaceColor = color(1,:);
b3(2).FaceColor = color(2,:);
b3(3).FaceColor = color(3,:);
% % % b3(4).FaceColor = [100, 255, 255]/255;
% % % b3(5).FaceColor = [100, 100, 255]/255;
xticks([1:6]);xticklabels( {'Drosophila','Mouse','Macaque','Human', 'C elegans global' , 'C elegans local'} )

% my_xticklabels(1:6,{'Drosophila','Mouse','Macaque','Human',{'C elegans','global'},{'C elegans','local'}},'Rotation',30);
ylabel('clustering coefficient error');
t = text(-0.1,1.15,'C','Units', 'Normalized', 'VerticalAlignment', 'Top');
% t.FontSize = 18;%ax = gca;
% ax.FontSize = 12;
% ylim([0,1.2]);
% % % saveas(3,'b-2','epsc');
% % % saveas(3,convertStringsToChars(strcat(path_fig,"clutering_coef_bu")),'epsc');
% % 
% % figure(4);
% % set(gcf,'Units','Normalized','OuterPosition',[0.5,0.4,.3,.3]);
subplot(2,2,4)
b4 = bar(abs([1-Q_pred./Q_true; 1- Q_ran./Q_true;1- Q_pure_ran./Q_true]'));
% b4 = bar([Q_pred./Q_true; Q_d./Q_true; Q_H./Q_true; Q_ran./Q_true; Q_pure_ran./Q_true]');
% b4(1).EdgeColor = 'none';
% b4(2).EdgeColor = 'none';
% b4(3).EdgeColor = 'none';
% b4(4).EdgeColor = 'none';
% b4(5).EdgeColor = 'none';
b4(1).FaceColor = color(1,:);
b4(2).FaceColor = color(2,:);
b4(3).FaceColor = color(3,:);
% % % b4(4).FaceColor = [100, 255, 255]/255;
% % % b4(5).FaceColor = [100, 100, 255]/255;
% my_xticklabels(1:6,{'Drosophila','Mouse','Macaque','Human',{'C elegans','global'},{'C elegans','local'}},'Rotation',30);
xticks([1:6]);xticklabels( {'Drosophila','Mouse','Macaque','Human', 'C elegans global' , 'C elegans local'} )
ylabel('modularity factor error');
t = text(-0.1,1.15,'D','Units', 'Normalized', 'VerticalAlignment', 'Top');
% t.FontSize = 18;
ax = gca;
% ax.FontSize = 12; 
% % saveas(4,'d-2','epsc');
% % saveas(4,convertStringsToChars(strcat(path_fig,"modularity")),'epsc');
% 
% % figure(5);
% % set(gcf,'Units','Normalized','OuterPosition',[0.5,0.4,.3,.3]);
% % b4 = bar([ASP_pred./ASP_true; ASP_d./ASP_true; ASP_H./ASP_true; ASP_ran./ASP_true; ASP_pure_ran./ASP_true]');
% % b4(1).EdgeColor = 'none';
% % b4(2).EdgeColor = 'none';
% % b4(3).EdgeColor = 'none';
% % b4(4).EdgeColor = 'none';
% % b4(5).EdgeColor = 'none';
% % % b4(1).FaceColor = [255., 100., 100. ]/255;
% % % b4(2).FaceColor = [255,  255, 100]/255;
% % % b4(3).FaceColor = [100, 255, 100]/255;
% % % b4(4).FaceColor = [100, 255, 255]/255;
% % % b4(5).FaceColor = [100, 100, 255]/255;
% % xticks([]);
% % 
% % saveas(5,'ASP','epsc');
% 
% % pause;
% % close all;
