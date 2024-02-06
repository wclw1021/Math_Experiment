function areas= areas(points, F)

    % 初始化一个存储面积的数组
    areas = zeros(1, size(F, 1));

    % 计算每个面的面积
    for i = 1:size(F, 1)
        index = F(i, :);  % 获取第i个面的顶点索引
        areas(i) = area(index, points);  % 计算面积并存储在数组中
    end
end

% area 函数用于计算三角形的面积, 完全可以polyarea但是老师给的是这个
function area = area(index, points)
    a = distance(points(index(1,1), :), points(index(1,2), :));
    b = distance(points(index(1,2), :), points(index(1,3), :));
    c = distance(points(index(1,3), :), points(index(1,1), :));
    p = (a + b + c) / 2;
    area = sqrt(p * (p - a) * (p - b) * (p - c));
end

% distance 函数用于计算两点之间的距离
function d = distance(p1, p2)
    d = norm(p1 - p2);  % 使用 norm 函数计算欧几里德距离
end
