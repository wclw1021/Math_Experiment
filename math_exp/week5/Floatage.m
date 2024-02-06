function Floatage = Floatage(points, F)
    Areas = areas(points, F);

    % 初始化总浮力
    Floatage = 0;

    % 计算总浮力
    for i = 1:size(F, 1)
        Floatage = Floatage + Areas(i);
    end
end

