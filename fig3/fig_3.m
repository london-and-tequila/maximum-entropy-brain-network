clear all;
clc;close all;
load('MEP_data_1005.mat');
figure(1);
norm_loc_maca = normalize_location(dis2loc(data.macaque.dis,3));
rand_growth_fix_degrees3(norm_loc_maca, 30, .05, .04, 51, 10, .5);
data_type = ["drosophila"; ...
    "mouse"; "macaque"; "human128"; "celegans_global"; "celegans_local";"shmetro"; "USAir";];
caption = ["Drosophila";"Mouse";"Macaque";"Human";"C. elegans global";"C. elegans local"];
order =["D";"E";"F";"G";"H";"I"];
for i = 1: 6
    adj = data.(data_type(i)).adj;
    adj = adj + adj'>0;
    dis = data.(data_type(i)).dis;
    adj_grow = data.(data_type(i)).adj_grow;
    con_dis_grow = adj_grow.*dis;
    con_dis = adj.*dis;
    [p_grow,~] = hist(con_dis_grow(find(con_dis_grow>0)),70);
    [p,~] = hist(con_dis(find(con_dis>0)),70);
    p_grow = p_grow/sum(p_grow); p = p/sum(p);
    subplot(3,3,i+3);hold on;bar(p,'EdgeColor','none','FaceColor',[0.6 0.6 0.6]);plot(p_grow,'-r','LineWidth',2);
    text(.71, .95, sprintf('R^2 = %.2f',rsquared(p, p_grow)), 'Units','normalized','FontSize',14);
    xticks([])
    yticks([])
    xlabel('wiring length'); ylabel('probability');
    t2 = text(.4, 1.05,caption(i) , 'Units','normalized');
    t = text(-.1,1,order(i), 'Units','normalized');
    t.FontSize = 19;
    t2.FontSize = 16;
    ax = gca;
ax.FontSize = 14; 
end
 subplot(3,3,4)
legend('experimental result','random axonal growth');
set(gcf,'renderer','Painters');
% saveas(1,'fig_3','epsc')

