function areas= Voronoi_areas(inter)

    % 初始化一个存储面积的数组
    areas = zeros(1, length(inter));

    % 计算每个面的面积
    for i = 1:length(inter)
        areas(i) = 0;
        Vertices = inter{i, 1}.Vertices;
        areas(i) = polyarea(Vertices(:,1),Vertices(:,2));
    end
end



