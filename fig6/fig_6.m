clear all;%close all;
% load('../data/ent_asp.mat');
data_type = ["drosophila"; ...
    "mouse"; "macaque"; "human"; "celegans_global"; "celegans_local"];
caption = ["Drosophila";"mouse";"Macaque";"Human";"C. elegans global";"C. elegans local"];
order =["A";"B";"C";"D";"E";"F"];
figure(2);set(gcf,'Units','Normalized','OuterPosition',[0.,0.3,.5,.45]);
count = 1;
for i = 1:6
    load(strcat("../data/correction_",data_type(i)));
    subplot(2,3,count);
    yyaxis left;plot(L,'-k');set(gca,'ycolor','k');yticks([]);ylabel('ASP');
    yyaxis right;plot(entropy,'-r');set(gca,'ycolor','k');yticks([]);
    ylabel('entropy','Color','r'); 
    xlim([1, numel(L)]);
    xlabel('correction step');
    title(caption(i),'FontWeight','normal','FontSize',13);
    t = text(-.15,1.1,order(count), 'Units','normalized');
    t.FontSize = 14;
%     hYLabel = get(gca,'YLabel');
%     set(hYLabel,'rotation',90);
    count = count +1;
end 