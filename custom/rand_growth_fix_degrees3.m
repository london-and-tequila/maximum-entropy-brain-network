function [adj, edge_loc, node_loc] = rand_growth_fix_degrees3(node_loc, max_out_deg, link_range, spatial_res, max_time, max_indeg, beta)
node_num = size(node_loc, 1);
edge_direc = rand(node_num, max_out_deg, 2);
edge_direc(:, :, 1) = (edge_direc(:, :, 1) - .5) * pi; % z axis angle
edge_direc(:, :, 2) = edge_direc(:, :, 2) * 2 * pi; %x-y plane angle
grow_index = ones(node_num, max_out_deg, 1); 
edge_loc = zeros(node_num, max_out_deg, 3);
adj = zeros(node_num);
for i = 1: max_out_deg
    edge_loc(:, i, :) = node_loc;
end
rng(1); 
for time = 1: max_time    
    if time == 10  % starts to grow axons
        subplot(1,3,1);
        plot_network3(node_loc, edge_loc, link_range, time, grow_index);
        t = text(-.1,1,"A", 'Units','normalized','FontSize',19);
    end
    if time == 30  % establishing connections
        subplot(1,3,2);
        plot_network3(node_loc, edge_loc, link_range, time, grow_index);
        t = text(-.1,1,"B", 'Units','normalized','FontSize',19);
    end
     if time == 400 % prunned axons and finalized connections
        subplot(1,3,3);
        plot_network3(node_loc, edge_loc, link_range, time, grow_index);
        t = text(-.1,1,"C", 'Units','normalized','FontSize',19);
    end

    for node = 1: node_num
        for i = 1: max_out_deg
            if grow_index(node, i, 1) > 0
                edge_loc(node, i, 1) = spatial_res * cos(edge_direc(node, i, 1)) * cos(edge_direc(node, i, 2)) + edge_loc(node, i, 1);
                edge_loc(node, i, 2) = spatial_res * cos(edge_direc(node, i, 1)) * sin(edge_direc(node, i, 1)) + edge_loc(node, i, 2);  
                edge_loc(node, i, 3) = spatial_res * sin(edge_direc(node, i, 1)) + edge_loc(node, i, 3);  
                % available node
                in_deg = sum(adj, 1);
                avail_node = find(in_deg < max_indeg);

                % detect link
                for j = 1: numel(avail_node)
                    if sqrt((edge_loc(node, i, 1) - node_loc(avail_node(j), 1))^2 + (edge_loc(node, i, 2) - node_loc(avail_node(j), 2))^2 + (edge_loc(node, i, 3) - node_loc(avail_node(j), 3))^2) < link_range && adj(node, avail_node(j))<1 && avail_node(j) ~= node 
                        if rand() < beta
                            adj(node, avail_node(j)) = 1;
                            adj(avail_node(j),node) = 1;
                            grow_index(node, i, 1) = 0;
                        end
                    end
                end
                
            end
        end
    end
end
