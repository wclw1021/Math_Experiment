function insideTriangles = Boundary_Points_Delaunay(boundary,points)
    
    % 进行 Delaunay 三角剖分
    triangulation = delaunayTriangulation(points);
    triangles = triangulation.ConnectivityList;

    % 获取三角形的中心点
    triangles_center = incenter(triangulation);

    % 定义封闭边界的点坐标
    boundaryX = boundary(:,1);  % 假设这是封闭边界的 x 坐标
    boundaryY = boundary(:,2);  % 假设这是封闭边界的 y 坐标

    % 创建一个逻辑向量，用于确定哪些三角形在天鹅内部
    insideBoundary = false(size(triangles_center, 1), 1);

    for i = 1:size(triangles_center, 1)
        triangle_center = triangles_center(i, :);
        % 检查三角形的中心点是否在天鹅内部
        if inpolygon(triangle_center(1), triangle_center(2), boundaryX, boundaryY)
            insideBoundary(i) = true;
        end
    end

    % 保留在边界内部的三角形的顶点
    insideTriangles = triangles(insideBoundary, :);
   
end

