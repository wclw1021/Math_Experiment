% 第一部分：画出z=|xy|的图像
% 定义 x 和 y 的范围
x = linspace(-2, 2, 100); % 生成从 -2 到 2 的 100 个点
y = linspace(-2, 2, 100);
[X, Y] = meshgrid(x, y);

% 计算 z 值
Z = abs(X .* Y);

% 绘制三维图像
figure;
surf(X, Y, Z);
hold on;  % 使得后面的绘图在其中进行

% 设置坐标轴标签
xlabel('X');
ylabel('Y');
zlabel('Z = |xy|');

% 添加标题
title('Three-Dimensional Plot of z = |xy|');

% 显示色标
colorbar;

% 绘制谷线
plot3(x, zeros(size(x)), zeros(size(x)), 'y', 'LineWidth', 2); % x = 0
plot3(zeros(size(y)), y, zeros(size(y)), 'c', 'LineWidth', 2); % y = 0

% 绘制脊线
plot3(x, x, abs(x.^2), 'r', 'LineWidth', 2); % y = x
plot3(x, -x, abs(x.^2), 'g', 'LineWidth', 2); % y = -x

% 添加谷线与脊线的图例，选择其一时请修改
legend('z = |xy|', 'x = 0', 'y = 0', 'y = x', 'y = -x', 'Location', 'NorthEast');

% 第二部分：画交线
% 2.1：绘制与 x = 1 的交线
x_plane = 1;
y_plane = linspace(-2, 2, 100);
z_plane = abs(x_plane .* y_plane);

% 找到交点
intersection_y = y_plane; % x = 1 与 z = |xy| 的交线的 y 坐标与平面 y 一致
intersection_z = abs(x_plane .* intersection_y); % 计算交线上的 z 坐标

% 绘制交线
figure;
plot3(ones(size(intersection_y)), intersection_y, intersection_z, 'r', 'LineWidth', 2);
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Intersection of x = 1 and z = |xy|');
grid on;

% 2.2：绘制与 y = 1 的交线
x_plane = linspace(-2, 2, 100);
y_plane = 1;
z_plane = abs(x_plane .* y_plane);

% 找到交点
intersection_x = x_plane; % y = 1 与 z = |xy| 的交线的 x 坐标与平面 x 一致
intersection_z = abs(y_plane .* intersection_x); % 计算交线上的 z 坐标

% 绘制交线
figure;
plot3(intersection_x, ones(size(intersection_x)), intersection_z, 'r', 'LineWidth', 2);
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Intersection of y = 1 and z = |xy|');
grid on;

% 2.3：绘制与 z = 1 的交线
figure;
contour(X, Y, Z, 1, 'k'); % 绘制等高线，截面在 z = 1 处
xlabel('X');
ylabel('Y');
title('Intersection of z = 1 and z = |xy|');