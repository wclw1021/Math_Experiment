k_values = (4000:4010); % 可以根据需要添加或更改k值

for k_idx = 1:length(k_values)
    k = k_values(k_idx);

    % 定义x的范围和点的数量
    x_values = (k-999:k+1000);
    x_values(x_values == k) = [];

    % 初始化空数组来存储距离的平方
    distances = zeros(size(x_values));

    % 计算每个点的距离的平方
    for i = 1:length(x_values)
        x = x_values(i);
        y = sin(x);
        distance_squared = (1/x - 1/k)^2 + (y - sin(k))^2;
        distances(i) = distance_squared;
    end

    % 找到最小距离的点
    [min_distance, min_index] = min(distances);
    min_distance_x = 1/x_values(min_index);
    min_distance_y = sin(x);

    fprintf('对于k = %d，最近的点是 (%f, %f)，距离最小的距离为 %f，对应的m为 %d \n', k, min_distance_x, min_distance_y, sqrt(min_distance), x_values(min_index));
end

%作图
% 初始化存储数据的数组
x_values = zeros(41, 1);
y_values = zeros(41, 1);

for k = 0:40
    x = 1 / (2000 - 44 * k);
    y = sin(1/x);
    x_values(k + 1) = x;
    y_values(k + 1) = y;
end

% 绘制散点图
scatter(x_values, y_values, 'filled');
xlabel('x');
ylabel('sin(x)');
title('sin(x) vs. x');




