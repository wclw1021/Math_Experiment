% 初始设置
process = 'F';
genetor = 'F-F+[-F+F-F]'; %生成方式
angle = 2*pi/3;    % 初始角度
rotation = pi/12;  % 每次旋转的角度
step = 1;         % 步长
iter_n = 4;       % 迭代次数
z = 0;            % 初始位置

% 根据生成规则生成分形树的字符串
for i = 1:iter_n
    process = strrep(process, 'F', genetor);
end

% 创建图形窗口
figure;
hold on;
axis equal;
axis off;
stack = [0, angle];  % 用于存储位置和角度信息的堆栈

% 遍历生成规则的每个字符
for k = 1:length(process)
    switch process(k)
        case 'F'
            % 绘制分支线段，颜色为绿色
            p = plot([z, z + exp(angle*1i)], 'Color', [0, 0.8, 0]); 
            p.LineWidth = 0.5; %控制宽度
            z = z + step*exp(angle*1i); 
        case '+'
            angle = angle + rotation;  % 左转
        case '-'
            angle = angle - rotation;  % 右转
        case '['
            stack = [stack; [z, angle]];  % 压栈
        case ']'
            z = stack(end, 1);      % 弹出位置
            angle = stack(end, 2);  % 弹出角度
            stack(end, :) = [];     % 出栈
        otherwise
    end
end

% 设置标题
name = ['Fractal tree with generator: ', genetor];
title(name);







