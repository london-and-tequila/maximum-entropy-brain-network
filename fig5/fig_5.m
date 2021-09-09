clear all;
%;
path_data = "../data/";
data_name = ["celegans_local";"drosophila-2";"mouse";"cocomac";"human";"USAir";"shmetro"];
path_fig =  "./";
for i = 1: numel(data_name)
    file_name = strcat(path_data, data_name(i), "_all.mat");
    load(convertStringsToChars(file_name));
    figure(i);
    set(gcf,'Units','Normalized','OuterPosition',[0,0.,1.,.5]);
    subplot(1, 4,  1);
    imshow(adj_true + 0.5);
%     fig = gcf;
%     fig.PaperPositionMode = 'auto'
%     fig_pos = fig.PaperPosition;
%     fig.PaperSize = [fig_pos(3) fig_pos(4)];
%     saveas(1,convertStringsToChars(strcat(path_fig,data_name(i),"_adj_true")),'tiff');
    
    subplot(1, 4, 2);
    imshow(adj_pred + 0.5);
%     fig = gcf;
%     fig.PaperPositionMode = 'auto'
%     fig_pos = fig.PaperPosition;
%     fig.PaperSize = [fig_pos(3) fig_pos(4)];
%     saveas(2,convertStringsToChars(strcat(path_fig,data_name(i),"_adj_pred")),'tiff');
    
    subplot(1, 4, 3);
    imshow(adj_ran + 0.5);
%     fig = gcf;
%     fig.PaperPositionMode = 'auto'
%     fig_pos = fig.PaperPosition;
%     fig.PaperSize = [fig_pos(3) fig_pos(4)];
%     saveas(3,convertStringsToChars(strcat(path_fig,data_name(i),"_adj_ran")),'tiff');
    
    subplot(1, 4, 4);
    imshow(adj_pure_ran + 0.5);
%     fig = gcf;
%     fig.PaperPositionMode = 'auto';
%     fig_pos = fig.PaperPosition;
%     fig.PaperSize = [fig_pos(3) fig_pos(4)];
%     saveas(4,convertStringsToChars(strcat(path_fig,data_name(i),"_adj_pure_ran")),'tiff');
    
%     figure(5);
%     imshow(adj_true + 0);
%     fig = gcf;
%     fig.PaperPositionMode = 'auto'
%     fig_pos = fig.PaperPosition;
%     fig.PaperSize = [fig_pos(3) fig_pos(4)];
%    saveas(1,convertStringsToChars(strcat(path_fig,data_name(i),"_adj")),'tiffn');
%    pause();close(1);
end
% pause;
close all;