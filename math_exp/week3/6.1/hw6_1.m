% 设置参数
t = linspace(0, 2*pi, 1000); % 在0到2*pi之间创建一组均匀分布的时间步骤，用于绘制在XOY平面内的黑色细线圆
R = 1; % 莫比乌斯带的主半径
r = 0.1; % 莫比乌斯带的半带宽
frames = 200; % 动画帧数

figure;
axis([-1.5 1.5 -1.5 1.5 -0.5 0.5]); 
axis off; 
view(3); 
hold on;

% 绘制在XOY平面内的黑色细线圆
plot3(R * cos(t), R * sin(t), zeros(size(t)), 'k', 'LineWidth', 1);

filename = '6.1.gif';

for frame = 1:frames
    % 计算当前帧的角度
    theta = 2*pi*frame/frames;

    % 莫比乌斯上条带的参数方程
    x_up = (R + r*cos(0.5*theta)) .* cos(theta);
    y_up = (R + r*cos(0.5*theta)) .* sin(theta);
    z_up = r*sin(0.5*theta);

    % 莫比乌斯下条带的参数方程
    x_low = (R - r*cos(0.5*theta)) .* cos(theta);
    y_low = (R - r*cos(0.5*theta)) .* sin(theta);
    z_low = -r*sin(0.5*theta);
    
    % 绘制连接线
    plot3([x_up(1), x_low(1)], [y_up(1), y_low(1)], [z_up(1), z_low(1)], 'k', 'LineWidth', 1);
    plot3([x_up(end), x_low(end)], [y_up(end), y_low(end)], [z_up(end), z_low(end)], 'k', 'LineWidth', 1);

    % 添加帧数标题
    title(['Frame ', num2str(frame), ' of ', num2str(frames) ' in Mobius']);

    % 保存当前帧到gif文件
    frame_image = getframe(gcf);
    im = frame2im(frame_image);
    [imind, cm] = rgb2ind(im, 256);
    
    if frame == 1
        imwrite(imind, cm, filename, 'gif', 'Loopcount', inf, 'DelayTime', 0.05);
    else
        imwrite(imind, cm, filename, 'gif', 'WriteMode', 'append', 'DelayTime', 0.05);
    end
end

% 关闭图形窗口
close(gcf);
















