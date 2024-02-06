function Voronoi_Depict(v,c, boundary)

    % 初始化存储交点的单元格数组
    inter = Voronoi_inter(v,c, boundary);
    % 遍历c中的索引
    for i = 1:numel(c)
        patch(inter{i,1}.Vertices(:,1),inter{i,1}.Vertices(:,2),'w','EdgeColor','blue');
    end
    axis equal;
end





