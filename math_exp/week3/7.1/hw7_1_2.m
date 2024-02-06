% 定义参数
a = 2 *sin(pi/8);             % 正方形边长的值
omega = 2*pi;      % 角速度 (每个周期 2*pi)
numFrames = 50;   % 总帧数
t = linspace(0, 2*pi/omega, numFrames);  % 时间范围

%顶点向量
D1 = [-a/2,cos(pi/8)];
D2 = [a/2,cos(pi/8)];
D3 = [cos(pi/8),a/2];
D4 = [cos(pi/8),-a/2];
D5 = [a/2,-cos(pi/8)];
D6 = [-a/2,-cos(pi/8)];
D7 = [-cos(pi/8),-a/2];
D8 = [-cos(pi/8),a/2];

%转点向量
P1 = (sqrt(2)-1) *D1;
P2 = (sqrt(2)-1) *D2;
P3 = (sqrt(2)-1) *D3;
P4 = (sqrt(2)-1) *D4;
P5 = (sqrt(2)-1) *D5;
P6 = (sqrt(2)-1) *D6;
P7 = (sqrt(2)-1) *D7;
P8 = (sqrt(2)-1) *D8;

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

% 创建一个半径为1的圆
radius = 1;
theta = linspace(0, 2*pi, 100); 
x = radius * cos(theta);
y = radius * sin(theta);

% 初始化GIF文件
filename = '7.1.2.3.gif';

for frame = 1:numFrames
    plot(x,y);
    hold on;
    % 计算第一个参数方程的 x(t) 和 y(t) 的值
    if t(frame) >= 0 && t(frame) <= pi/(4*omega)
        z = rotate_vector(D1, omega*t(frame), D2);
        x1(frame) = z(1);
        y1(frame) = z(2);
    elseif t(frame) > pi/(4*omega) && t(frame) <= pi/(2*omega)
        z = rotate_vector(P1, omega*t(frame)- pi/4, D3);
        x1(frame) = z(1);
        y1(frame) = z(2);    
    elseif t(frame) > pi/(2*omega) && t(frame) <= 3*pi/(4*omega)
        z = rotate_vector(P5, omega*t(frame)- pi/2, D4);
        x1(frame) = z(1);
        y1(frame) = z(2);  
    elseif t(frame) > 3*pi/(4*omega) && t(frame) <= pi/omega
        z = rotate_vector(D5, omega*t(frame)- 3*pi/4, D5);
        x1(frame) = z(1);
        y1(frame) = z(2);
    elseif t(frame) > pi/omega && t(frame) <= 5*pi/(4*omega)
        z = rotate_vector(D5, omega*t(frame)- pi, D6);
        x1(frame) = z(1);
        y1(frame) = z(2);
    elseif t(frame) > 5*pi/(4*omega) && t(frame) <= 3*pi/(2*omega)
        z = rotate_vector(P5, omega*t(frame)- 5*pi/4, D7);
        x1(frame) = z(1);
        y1(frame) = z(2);
    elseif t(frame) > 3*pi/(2*omega) && t(frame) <= 7*pi/(4*omega)
        z = rotate_vector(P1, omega*t(frame)- 3*pi/2, D8);
        x1(frame) = z(1);
        y1(frame) = z(2);
    elseif t(frame) > 7*pi/(4*omega) && t(frame) <= 2*pi/omega
        z = rotate_vector(D1, omega*t(frame) -7*pi/4, D1);
        x1(frame) = z(1);
        y1(frame) = z(2);
    end

     % 计算第二个参数方程的 x(t) 和 y(t) 的值
    if t(frame) >= 0 && t(frame) <= pi/(4*omega)
        z = rotate_vector(D2, omega*t(frame), D2);
        x2(frame) = z(1);
        y2(frame) = z(2);
    elseif t(frame) > pi/(4*omega) && t(frame) <= pi/(2*omega)
        z = rotate_vector(D2, omega*t(frame)- pi/4, D3);
        x2(frame) = z(1);
        y2(frame) = z(2);    
    elseif t(frame) > pi/(2*omega) && t(frame) <= 3*pi/(4*omega)
        z = rotate_vector(P2, omega*t(frame)- pi/2, D4);
        x2(frame) = z(1);
        y2(frame) = z(2);  
    elseif t(frame) > 3*pi/(4*omega) && t(frame) <= pi/omega
        z = rotate_vector(P6, omega*t(frame)- 3*pi/4, D5);
        x2(frame) = z(1);
        y2(frame) = z(2);
    elseif t(frame) > pi/omega && t(frame) <= 5*pi/(4*omega)
        z = rotate_vector(D6, omega*t(frame)- pi, D6);
        x2(frame) = z(1);
        y2(frame) = z(2);
    elseif t(frame) > 5*pi/(4*omega) && t(frame) <= 3*pi/(2*omega)
        z = rotate_vector(D6, omega*t(frame)- 5*pi/4, D7);
        x2(frame) = z(1);
        y2(frame) = z(2);
    elseif t(frame) > 3*pi/(2*omega) && t(frame) <= 7*pi/(4*omega)
        z = rotate_vector(P6, omega*t(frame)- 3*pi/2, D8);
        x2(frame) = z(1);
        y2(frame) = z(2);
    elseif t(frame) > 7*pi/(4*omega) && t(frame) <= 2*pi/omega
        z = rotate_vector(P2, omega*t(frame)+ 6*pi/(4*omega), D1);
        x2(frame) = z(1);
        y2(frame) = z(2);
    end

    % 计算第三个参数方程的 x(t) 和 y(t) 的值
    if t(frame) >= 0 && t(frame) <= pi/(4*omega)
        z = rotate_vector(P3, omega*t(frame), D2);
        x3(frame) = z(1);
        y3(frame) = z(2);
    elseif t(frame) > pi/(4*omega) && t(frame) <= pi/(2*omega)
        z = rotate_vector(D3, omega*t(frame)- pi/4, D3);
        x3(frame) = z(1);
        y3(frame) = z(2);    
    elseif t(frame) > pi/(2*omega) && t(frame) <= 3*pi/(4*omega)
        z = rotate_vector(D3, omega*t(frame)- pi/2, D4);
        x3(frame) = z(1);
        y3(frame) = z(2);  
    elseif t(frame) > 3*pi/(4*omega) && t(frame) <= pi/omega
        z = rotate_vector(P3, omega*t(frame)- 3*pi/4, D5);
        x3(frame) = z(1);
        y3(frame) = z(2);
    elseif t(frame) > pi/omega && t(frame) <= 5*pi/(4*omega)
        z = rotate_vector(P7, omega*t(frame)- pi, D6);
        x3(frame) = z(1);
        y3(frame) = z(2);
    elseif t(frame) > 5*pi/(4*omega) && t(frame) <= 3*pi/(2*omega)
        z = rotate_vector(D7, omega*t(frame)- 5*pi/4, D7);
        x3(frame) = z(1);
        y3(frame) = z(2);
    elseif t(frame) > 3*pi/(2*omega) && t(frame) <= 7*pi/(4*omega)
        z = rotate_vector(D7, omega*t(frame)- 3*pi/2, D8);
        x3(frame) = z(1);
        y3(frame) = z(2);
    elseif t(frame) > 7*pi/(4*omega) && t(frame) <= 2*pi/omega
        z = rotate_vector(P7, omega*t(frame)+ 6*pi/(4*omega), D1);
        x3(frame) = z(1);
        y3(frame) = z(2);
    end

    % 计算第四个参数方程的 x(t) 和 y(t) 的值
    if t(frame) >= 0 && t(frame) <= pi/(4*omega)
        z = rotate_vector(P8, omega*t(frame), D2);
        x4(frame) = z(1);
        y4(frame) = z(2);
    elseif t(frame) > pi/(4*omega) && t(frame) <= pi/(2*omega)
        z = rotate_vector(P4, omega*t(frame)- pi/4, D3);
        x4(frame) = z(1);
        y4(frame) = z(2);    
    elseif t(frame) > pi/(2*omega) && t(frame) <= 3*pi/(4*omega)
        z = rotate_vector(D4, omega*t(frame)- pi/2, D4);
        x4(frame) = z(1);
        y4(frame) = z(2);  
    elseif t(frame) > 3*pi/(4*omega) && t(frame) <= pi/omega
        z = rotate_vector(D4, omega*t(frame)- 3*pi/4, D5);
        x4(frame) = z(1);
        y4(frame) = z(2);
    elseif t(frame) > pi/omega && t(frame) <= 5*pi/(4*omega)
        z = rotate_vector(P4, omega*t(frame)- pi, D6);
        x4(frame) = z(1);
        y4(frame) = z(2);
    elseif t(frame) > 5*pi/(4*omega) && t(frame) <= 3*pi/(2*omega)
        z = rotate_vector(P8, omega*t(frame)- 5*pi/4, D7);
        x4(frame) = z(1);
        y4(frame) = z(2);
    elseif t(frame) > 3*pi/(2*omega) && t(frame) <= 7*pi/(4*omega)
        z = rotate_vector(D8, omega*t(frame)- 3*pi/2, D8);
        x4(frame) = z(1);
        y4(frame) = z(2);
    elseif t(frame) > 7*pi/(4*omega) && t(frame) <= 2*pi/omega
        z = rotate_vector(D8, omega*t(frame)+ 6*pi/(4*omega), D1);
        x4(frame) = z(1);
        y4(frame) = z(2);
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

    % %作出内部一点的运动轨迹（2，4中点）
    % px2(frame) = (x2(frame) + x4(frame))/2;
    % py2(frame) = (y2(frame) + y4(frame))/2;
    % plot(px2(1:frame), py2(1:frame), 'r', 'LineWidth', 2);
    % hold on;

    % % 作出外部一点的运动轨迹
    % px3(frame) = 3/2 * x1(frame) + 1/2 * x2(frame) - x4(frame);
    % py3(frame) = 3/2 * y1(frame) + 1/2 * y2(frame) - y4(frame);
    % plot(px3(1:frame), py3(1:frame), 'r', 'LineWidth', 2);
    % hold on;

    % 绘画正方形的滚动
    plot([x1(frame), x2(frame), x3(frame), x4(frame), x1(frame)], [y1(frame), y2(frame), y3(frame), y4(frame), y1(frame)], 'k', 'LineWidth', 2);
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

