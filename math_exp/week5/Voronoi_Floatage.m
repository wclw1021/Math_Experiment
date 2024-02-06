function Floatage = Voronoi_Floatage(inter)
    Areas = Voronoi_areas(inter);

    % 初始化总浮力
    Floatage = 0;

    % 计算总浮力
    for i = 1:length(inter)
        Floatage = Floatage + Areas(i);
    end
end

