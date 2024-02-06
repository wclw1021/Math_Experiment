% 设置随机点数量
num_points = 100000; 

% 生成随机点在立体包围盒内
x = 2 * (rand(1, num_points) - 0.5); % x在[-1, 1]范围内
y = 2 * (rand(1, num_points) - 0.5); % y在[-1, 1]范围内
z = 2 * (rand(1, num_points) - 0.5); % z在[-1, 1]范围内

% 统计在立体内的随机点数量
inside_points = (x.^2 + y.^2 <= 1 & x.^2 + z.^2 <= 1 & y.^2 + z.^2 <= 1);

% 获取立体内的随机点坐标
x_inside = x(inside_points);
y_inside = y(inside_points);
z_inside = z(inside_points);

% 计算立体的体积估计值
total_volume = 8; 
volume_estimate = total_volume * (sum(inside_points) / num_points);

% 输出体积估计值
fprintf('估计的立体体积为：%f\n', volume_estimate);

% 绘制模拟点图
figure;
scatter3(x_inside, y_inside, z_inside, 5, 'filled', 'r');
xlabel('X轴');
ylabel('Y轴');
zlabel('Z轴');
hold on;

% 绘制曲面图
[X, Y, Z] = meshgrid(linspace(-1, 1, 100), linspace(-1, 1, 100), linspace(-1, 1, 100));
V = (X.^2 + Y.^2 <= 1) & (X.^2 + Z.^2 <= 1) & (Y.^2 + Z.^2 <= 1);
isosurface(X, Y, Z, V, 0.5, 'b');
title('模拟图');
grid on;
axis equal;

% 显示图形
axis([-1, 1, -1, 1, -1, 1]);
