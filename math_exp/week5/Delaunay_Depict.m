function  Delaunay_Depict(points,insideTriangles)
    % 绘制剖分后的内部三角形
    figure;
    hold on;

    for i = 1:size(insideTriangles, 1)
        triangle = insideTriangles(i, :);
        triangle_vertex_x = zeros(4,1);
        triangle_vertex_y = zeros(4,1);
        for j = 1:3
            triangle_vertex_x(j,1) = points(triangle(j),1);
            triangle_vertex_y(j,1) = points(triangle(j),2);
        end
        triangle_vertex_x(4,1) = points(triangle(1),1);
        triangle_vertex_y(4,1) = points(triangle(1),2);
        plot(triangle_vertex_x, triangle_vertex_y, 'b-'); % 绘制内部三角形
    end

    % 设置图标题和坐标轴标签
    title('Swan''s Delaunay');
    xlabel('X');
    ylabel('Y');

    % 显示图形
    axis equal;
    hold off;
end

