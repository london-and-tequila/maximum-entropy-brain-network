function [] = plot_network3(node_loc, edge_loc, link_range, n, grow_index)

node_num = size(edge_loc, 1);
edge_num = size(edge_loc, 2);

set(gcf, 'Units','Normalized','OuterPosition',[0,0,1,.6]);
axis tight manual;
hold on;

% plot spheres for each node 
[x y z] = sphere(256); 
for i = 1: node_num
h = surfl(x*link_range + node_loc(i,1), y*link_range + node_loc(i,2), z*link_range + node_loc(i,3));
set(h, 'FaceAlpha', 0.5) % transparency of spheres
shading interp;
colormap(flip(brewermap([],'Greys'))); % use external colormap, dependent on: brewermap.m
daspect([1 1 1]);
end
% plot axons and connections
for i = 1: node_num
    for j = 1: edge_num
        if grow_index(i, j) == 0
             plot3([node_loc(i, 1), edge_loc(i, j, 1)], [node_loc(i, 2), edge_loc(i, j, 2)], ...
                 [node_loc(i, 3), edge_loc(i, j, 3)], 'Color',[1.,0.,0.],'LineWidth', 1.5);
         else 
            if norm(squeeze(edge_loc(i,j,:)) - node_loc(i,:)', 2) < .6 % only plot short axons
                plot3([node_loc(i, 1), edge_loc(i, j, 1)], [node_loc(i, 2), edge_loc(i, j, 2) ], ...
                    [node_loc(i, 3), edge_loc(i, j, 3)],'Color',[.4, .4, .4],'LineWidth',.25);
            end
        end
    end
end

grid off;
xlim([0, .8]);ylim([0, .8]);zlim([0, .8]);

set(gca, 'Units', 'Points');
xticks([]); yticks([]); zticks([]);

% remove default axis, plot shorter axis instead
set(gca,'XColor', 'none','YColor','none','ZColor','none')
plot3([0, 0.25], [0, 0], [0, 0],'k');
plot3([0, 0], [0, 0.25], [0, 0],'k');
plot3([0, 0], [0, 0], [0, 0.25],'k');

view(30,10)

