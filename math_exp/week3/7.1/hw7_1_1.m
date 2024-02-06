% 定义参数
a = 1;             % a 的值
omega = 2*pi;      % 角速度 (每个周期 2*pi)
numFrames = 50;   % 总帧数
t = linspace(0, 2*pi/omega, numFrames);  % 时间范围

% 初始化 x 和 y 向量
x1 = zeros(size(t));
y1 = zeros(size(t));
x2 = zeros(size(t));
y2 = zeros(size(t));
x3 = zeros(size(t));
y3 = zeros(size(t));
x4 = zeros(size(t));
y4 = zeros(size(t));
px1 = zeros(size(t));
py1 = zeros(size(t));
px2 = zeros(size(t));
py2 = zeros(size(t));
px3 = zeros(size(t));
py3 = zeros(size(t));

% 初始化GIF文件
filename = '7.1.1.3.gif';

for frame = 1:numFrames
    % 计算第一个参数方程的 x(t) 和 y(t) 的值
    if t(frame) >= 0 && t(frame) <= pi/(2*omega)
        x1(frame) = a - a*cos(omega*t(frame));
        y1(frame) = a*sin(omega*t(frame));
    elseif t(frame) > pi/(2*omega) && t(frame) <= pi/omega
        x1(frame) = 2*a - a*cos(omega*t(frame)) - a*sin(omega*t(frame));
        y1(frame) = -a*cos(omega*t(frame)) + a*sin(omega*t(frame));
    elseif t(frame) > pi/omega && t(frame) <= 3*pi/(2*omega)
        x1(frame) = 3*a - a*sin(omega*t(frame));
        y1(frame) = -a*cos(omega*t(frame));
    elseif t(frame) > 3*pi/(2*omega) && t(frame) <= 2*pi/omega
        x1(frame) = 4*a;
        y1(frame) = 0;
    end
    
    % 计算第二个参数方程的 x(t) 和 y(t) 的值
    if t(frame) >= 0 && t(frame) <= pi/(2*omega)
        x2(frame) = a - a*cos(omega*t(frame)) + a*sin(omega*t(frame));
        y2(frame) = a*cos(omega*t(frame)) + a*sin(omega*t(frame));
    elseif t(frame) > pi/(2*omega) && t(frame) <= pi/omega
        x2(frame) = 2*a - a*cos(omega*t(frame));
        y2(frame) = a*sin(omega*t(frame));
    elseif t(frame) > pi/omega && t(frame) <= 3*pi/(2*omega)
        x2(frame) = 3*a;
        y2(frame) = 0;
    elseif t(frame) > 3*pi/(2*omega) && t(frame) <= 2*pi/omega
        x2(frame) = 4*a + a*sin(omega*t(frame));
        y2(frame) = a*cos(omega*t(frame));
    end
    
     % 计算第三个参数方程的 x(t) 和 y(t) 的值
    if t(frame) >= 0 && t(frame) <= pi/(2*omega)
        x3(frame) = a + a*sin(omega*t(frame));
        y3(frame) = a*cos(omega*t(frame));
    elseif t(frame) > pi/(2*omega) && t(frame) <= pi/omega
        x3(frame) = 2*a;
        y3(frame) = 0;
    elseif t(frame) > pi/omega && t(frame) <= 3*pi/(2*omega)
        x3(frame) = 3*a + a*cos(omega*t(frame));
        y3(frame) = -a*sin(omega*t(frame));
    elseif t(frame) > 3*pi/(2*omega) && t(frame) <= 2*pi/omega
        x3(frame) = 4*a + a*sin(omega*t(frame)) + a*cos(omega*t(frame));
        y3(frame) = a*cos(omega*t(frame)) - a*sin(omega*t(frame));
    end

    % 计算第四个参数方程的 x(t) 和 y(t) 的值
    if t(frame) >= 0 && t(frame) <= pi/(2*omega)
        x4(frame) = a;
        y4(frame) = 0;
    elseif t(frame) > pi/(2*omega) && t(frame) <= pi/omega
        x4(frame) = 2*a - a*sin(omega*t(frame));
        y4(frame) = -a*cos(omega*t(frame));
    elseif t(frame) > pi/omega && t(frame) <= 3*pi/(2*omega)
        x4(frame) = 3*a + a*cos(omega*t(frame)) - a*sin(omega*t(frame));
        y4(frame) = -a*cos(omega*t(frame)) - a*sin(omega*t(frame));
    elseif t(frame) > 3*pi/(2*omega) && t(frame) <= 2*pi/omega
        x4(frame) = 4*a + a*cos(omega*t(frame));
        y4(frame) = -a*sin(omega*t(frame));
    end

    % % 绘制四个参数方程的轨迹，可以验证顶点的正确性
    % plot(x1(1:frame), y1(1:frame), 'b', 'LineWidth', 2);
    % hold on;
    % plot(x2(1:frame), y2(1:frame), 'r', 'LineWidth', 2);
    % hold on;
    % plot(x3(1:frame), y3(1:frame), 'g', 'LineWidth', 2);
    % hold on;
    % plot(x4(1:frame), y4(1:frame), 'y', 'LineWidth', 2);
    % hold on;

    % %作出边上一点的运动轨迹（1，2中点）
    % px1(frame) = (x1(frame) + x2(frame))/2;
    % py1(frame) = (y1(frame) + y2(frame))/2;
    % plot(px1(1:frame), py1(1:frame), 'r', 'LineWidth', 2);
    % hold on;

    % % 作出内部一点的运动轨迹（2，4中点）
    % px2(frame) = (x2(frame) + x4(frame))/2;
    % py2(frame) = (y2(frame) + y4(frame))/2;
    % plot(px2(1:frame), py2(1:frame), 'r', 'LineWidth', 2);
    % hold on;

    % 作出外部一点的运动轨迹
    px3(frame) = 3/2 * x1(frame) + 1/2 * x2(frame) - x4(frame);
    py3(frame) = 3/2 * y1(frame) + 1/2 * y2(frame) - y4(frame);
    plot(px3(1:frame), py3(1:frame), 'r', 'LineWidth', 2);
    hold on;

    % 绘画正方形的滚动
    plot([x1(frame), x2(frame), x3(frame), x4(frame), x1(frame)], [y1(frame), y2(frame), y3(frame), y4(frame), y1(frame)], 'k', 'LineWidth', 2);
    axis equal;
    xlabel('x(t)');
    ylabel('y(t)');
    axis([-a, 5*a, -2*a, 3*a]);
    axis off;

    % 保存当前帧为GIF
    frameObj = getframe(gcf);
    im = frame2im(frameObj);
    [A, map] = rgb2ind(im, 256);
    
    if frame == 1
        imwrite(A, map, filename, 'gif', 'LoopCount', Inf, 'DelayTime', 0.1);
    else
        imwrite(A, map, filename, 'gif', 'WriteMode', 'append', 'DelayTime', 0.1);
    end
    
    hold off;
end
























