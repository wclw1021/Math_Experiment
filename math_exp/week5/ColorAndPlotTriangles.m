function ColorAndPlotTriangles(k_opt, insideTriangles, points, mu)
    % k_opt: 包含每个三角形的 k_opt 值的向量
    % insideTriangles: 包含三角形的索引的矩阵
    % points: 包含点坐标的矩阵
    % mu: 颜色映射数量
    % 创建一个绘图窗口
    figure;

    % 根据 k_opt 的值分配颜色并绘制每个三角形
    for i = 1:size(insideTriangles, 1)
        colorIndex = round(k_opt(i) * (mu - 1)) + 1;  % 映射到颜色索引
        triangle = insideTriangles(i, :);
        trianglePoints = points(triangle, :);
        fill(trianglePoints(:, 1), trianglePoints(:, 2), colorIndex);  % 绘制染色三角形
        hold on;  % 保持绘图
    end

    axis equal;  % 设置坐标轴等比例
    axis off;
    title('Colored Swan');  % 设置图形标题
    
    % 添加颜色条（colorbar），显示刻度从下到上的指定值
    colorbar('Ticks',[1,mu/5,2*mu/5,3*mu/5,4*mu/5,mu],'TickLabels',{'0.0','0.2','0.4','0.6','0.8','1.0'});
end




