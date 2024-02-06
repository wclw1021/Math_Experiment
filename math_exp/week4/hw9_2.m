% 定义一组p和q的参数
p_values = [0, -1, 0.11,-0.10281,-1.25];
q_values = [1, 0, 0.66,0.95723,-0.01];

% 其他参数
N = 1000;
a = 7680;
b = 4320;
K = 16;

% 遍历p和q的参数组合
for param_idx = 1:length(p_values)
    p = p_values(param_idx);
    q = q_values(param_idx);
    
    % 调用绘制Julia集的函数
    figure;
    drawJuliaSet(p, q, N, a, b, K);
end

function drawJuliaSet(p, q, N, a, b, K)
    % 设定上界值
    M = max(2, sqrt(p^2 + q^2));
    
    % 创建a x b的图像
    img = zeros(a, b);
    
    % 构建网格
    x_range = linspace(-M, M, a);
    y_range = linspace(-M, M, b);
    
    for i = 1:a
        for j = 1:b
            x0 = x_range(i);
            y0 = y_range(j);
            
            x = x0;
            y = y0;
            %迭代计数器
            k = 0;
            while k < N && x^2 + y^2 <= M^2
                x_temp = x^2 - y^2 + p;
                y_temp = 2 * x * y + q;
                x = x_temp;
                y = y_temp;
                k = k + 1;
            end
            
            if k == N
                img(i, j) = 0;  % 初值($x_0,y_0$)处的像素设置为深色
            else
                img(i, j) = mod(k, K);  % 从某一步n开始，用n mod K处理
            end
        end
    end
    
    % 绘制Julia集
    colormap(jet(K)); 
    imagesc(img);
    axis off;
    colorbar;
    
    title(['Julia Set for p=', num2str(p), ', q=', num2str(q)]);
end




