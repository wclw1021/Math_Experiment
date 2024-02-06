% 定义参数
s = 0.4 + 0.4i; % s的值
p1 = 0.5; % 概率
z = 0; %初始值
points = zeros(1, 10000); % 存储迭代的点
iterations = length(points); % 迭代次数

for i = 1:iterations
    % 随机选择一个变换，rand生成0,1之间的随机数，边界值影响可以忽略
    r = rand();
    if r < p1
        z = s * z + 1;
    else
        z = s * z - 1;
    end
    points(i) = z;
end

% 提取实部和虚部
x = real(points);
y = imag(points);

% 绘制IFS吸引子图形，散点图
scatter(x, y, 1);
title(['IFS Attractor, when s = ', num2str(s)]);
axis equal; 
axis off;
