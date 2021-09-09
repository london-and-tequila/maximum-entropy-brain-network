function [p, q, r, dcen] = optimize_pd(adj, dis, bin_num,  vis_op, inset_op ,save_op,file_name)

% INPUT: adj: adjacency matrix
%        dis: distance matrix
%        bin_num: number of bins
%        vis_op: 1: plot count of r, q, p; 0: plot freq of q, p
%        inset_op: 1: put inset; 0: don't
%        save_fig: 1: save; 0: dont save
%        fig_name: figure's name
% OUTPUT: p: optimized p(d)
%         q: real p(d)
%         r: full distance distribution
%         dcen: bin center
% Note: cvx_solver = SeDuMi

adj = adj +adj'> 0;
node = size(adj,1);
n = sum(sum(adj));
N = node*(node - 1);
[r, dcen] = hist(reshape(dis(find(dis > 0)), [prod(size(dis(find(dis > 0)))), 1]), bin_num);
r = r/sum(r);
[q, dcen] = hist(reshape(dis(find(adj > 0)), [prod(size(dis(find(adj > 0)))), 1]), dcen);
q = q/sum(q);
m = bin_num;
% disp(size(q));disp(size(dcen));disp(size(r));
cvx_solver  SeDuMi;
cvx_begin
    variable p(bin_num) nonnegative;
    minimize(- sum(sum(entr( p )) ));
    subject to
        sum(sum(p)) == 1;
        p' * ones(m, 1) == q * ones(m, 1);
        dcen * p <= q * dcen';
        p' <= r * N / n%*.08
cvx_end

figure(1);  
set(gcf, 'Units', 'Normalized', 'OuterPosition', [.8, 0.64, .18, 0.25]);
hold on;
% xticks([]);
% yticks([]);
if vis_op == 1
    bar(dcen, r * N, 'FaceColor',[0.8 0.8 0.8],'EdgeColor','none');
     bar(dcen, q * n, 'FaceColor',[.5 .5 .5],'EdgeColor','none');
    plot(dcen, p * n,'-r','LineWidth',.5);
    text(.71, .95 ,sprintf("R^2 = %.2f",rsquared(q, p')), 'Units','normalized');
    xticks([])
    yticks([])
%     legend('r_iN(N-1)/n','true p_i','predicted p_i')
%     a.Color = 'white';
%     legend(sprintf("R^2 = %.2f",rsquared(q, p')));
%     title(sprintf("R^2 = %.2f",rsquared(q, p')));
    if inset_op > 0
    axes('Position',[.5 .42 .4 .4])
    box on
    hold on
    bar(dcen, q , 'FaceColor',[0.5 0.5 0.5],'EdgeColor','none');
    plot(dcen, p,'-r','LineWidth',.5);
    xticks([])
    yticks([])
    end
end

if vis_op == 0
    bar(dcen, q , 'FaceColor',[0.5 0.5 0.5],'EdgeColor','none');
%     plot(dcen, p,'--k*','LineWidth',1,'MarkerSize',1);
%     legend( 'q', 'p');
%     title(sprintf("R^2 = %.2f",rsquared(q, p')));
end
% xticks([]);
% yticks([]);
if save_op>0
    saveas(1,file_name,'png');
end
% close(1);