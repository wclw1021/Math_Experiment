function Gravity = Voronoi_Gravity(k, inter)
    
    Areas = Voronoi_areas(inter);

    % 初始化总重力
    Gravity = 0;

    % 计算总重力，将每个面的面积乘以对应的弹簧常数并求和
    for i = 1:length(inter)
        Gravity = Gravity + k(i) * Areas(i);
    end
end

