function Gravity = Gravity(k, points, F)

    Areas = areas(points, F);

    % 初始化总重力
    Gravity = 0;

    % 计算总重力，将每个面的面积乘以对应的弹簧常数并求和
    for i = 1:size(F, 1)
        Gravity = Gravity + k(i) * Areas(i);
    end
end




