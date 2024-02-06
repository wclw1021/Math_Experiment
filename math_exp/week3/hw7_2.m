% 定义初始参数
n = 20; % 多边形的边数
theta = 2 * pi / n;

% 定义初始n边形的顶点坐标
vertices = zeros(n + 1, 2);
vertices(1, :) = [0, 1];
R = [cos(theta), -sin(theta); sin(theta), cos(theta)];
for i = 2:n + 1
    vertices(i, :) = R * vertices(i - 1, :)';
end

% 设置迭代次数（控制生成的层数）
iterations = 500;

% 创建第一种填充方式的图形窗口
figure(1);

% 开始迭代生成对数螺线（第一种填充方式）
for iter = 1:iterations
    % 绘制正n边形
    plot(vertices(:, 1), vertices(:, 2), 'k', 'LineWidth', 0.5);
    hold on;

    % 计算下一个n边形的顶点坐标
    new_vertices = zeros(n + 1, 2);
    for i = 1:n
        j = mod(i, n) + 1;
        new_vertices(i, :) = (7/10) * vertices(i, :) + (3/10) * vertices(j, :);
    end
    new_vertices(n + 1, :) = new_vertices(1, :);

    % 填充方式
    if mod(iter, 2)
        for i = 2:n
            x = [vertices(i, 1), new_vertices(i - 1, 1), new_vertices(i, 1)];
            y = [vertices(i, 2), new_vertices(i - 1, 2), new_vertices(i, 2)];
            fill(x, y, [0, 56, 168] / 255); % 填充蓝色
        end
        x = [vertices(1, 1), new_vertices(n, 1), new_vertices(1, 1)];
        y = [vertices(1, 2), new_vertices(n, 2), new_vertices(1, 2)];
        fill(x, y, [0, 56, 168] / 255); % 填充蓝色
    end

    % 更新顶点坐标以进行下一次迭代
    vertices = new_vertices;
end

axis equal; % 保持坐标轴比例一致，以展示螺线效果
title('追逐曲线生成的对数螺线（第一种填充方式）');

% 创建第二种填充方式的图形窗口
figure(2);

% 重新初始化初始参数和顶点坐标
n = 20; % 多边形的边数
theta = 2 * pi / n;
vertices = zeros(n + 1, 2);
vertices(1, :) = [0, 1];
R = [cos(theta), -sin(theta); sin(theta), cos(theta)];
for i = 2:n + 1
    vertices(i, :) = R * vertices(i - 1, :)';
end

% 开始迭代生成对数螺线（第二种填充方式）
for iter = 1:iterations
    % 绘制正n边形
    plot(vertices(:, 1), vertices(:, 2), 'k', 'LineWidth', 0.5);
    hold on;

    % 计算下一个n边形的顶点坐标
    new_vertices = zeros(n + 1, 2);
    for i = 1:n
        j = mod(i, n) + 1;
        new_vertices(i, :) = (7/10) * vertices(i, :) + (3/10) * vertices(j, :);
    end
    new_vertices(n + 1, :) = new_vertices(1, :);

    % 第二种填充方式
    for i = 2:2:n
        x = [vertices(i, 1), new_vertices(i - 1, 1), new_vertices(i, 1)];
        y = [vertices(i, 2), new_vertices(i - 1, 2), new_vertices(i, 2)];
        fill(x, y, [0, 56, 168] / 255); % 填充蓝色
    end

    % 更新顶点坐标以进行下一次迭代
    vertices = new_vertices;
end

axis equal; % 保持坐标轴比例一致，以展示螺线效果
title('追逐曲线生成的对数螺线（第二种填充方式）');



