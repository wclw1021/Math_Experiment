function inter = Voronoi_inter(v,c, boundary)
    % 初始化存储交点的单元格数组
    inter = cell(size(c));

    % 遍历c中的索引
    for i = 1:length(c)
            v_x = v(c{i}, 1);
            v_y = v(c{i}, 2);
            shape = polyshape(v_x, v_y);
            boundary_shape = polyshape(boundary);
            inter{i} = intersect(shape, boundary_shape);
    end
end

