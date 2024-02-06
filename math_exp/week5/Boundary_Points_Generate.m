function points = Boundary_Points_Generate(boundary, kx, ky)

    % 生成网格坐标
    x = linspace(min(boundary(:, 1)), max(boundary(:, 1)), kx);
    y = linspace(min(boundary(:, 2)), max(boundary(:, 2)), ky);
    [x, y] = meshgrid(x, y);

    % 将网格坐标转换成一维坐标
    x = x(:);
    y = y(:);
    points = [x, y];

    % 定义封闭边界的点坐标
    boundaryX = boundary(:,1);  % 假设这是封闭边界的 x 坐标
    boundaryY = boundary(:,2);  % 假设这是封闭边界的 y 坐标
    
    % 创建一个逻辑向量，用于确定哪些三角形在天鹅内部

    insideBoundary = false(kx*ky,1);

    for i = 1:kx*ky
        if inpolygon(points(i,1), points(i,2),boundaryX, boundaryY)
            insideBoundary(i,1) = true;
        end
    end

    % 保留在边界内部的三角形的顶点
    points = points(insideBoundary, :);
    points = [points; boundary];
    % 返回均匀的网格坐标
    
end

