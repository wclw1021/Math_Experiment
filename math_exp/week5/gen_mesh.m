function [V, F] = gen_mesh(bound)
    % 从离散的边界(顺序的)生成三角网格，返回顶点和面
    region = polyshape(bound(:, 1), bound(:, 2));
    tr = triangulation(region);
    model = createpde;
    tnodes = tr.Points';
    telements = tr.ConnectivityList';
    geometryFromMesh(model, tnodes, telements);
    mesh = generateMesh(model, "Hmax", 3, "GeometricOrder", "linear"); %参数2表示方片的半径
    
    % 提取顶点坐标和面的连接信息
    V = mesh.Nodes';
    F = mesh.Elements';

    % 如果V的z坐标不需要，可以删除z坐标
    V = V(:, 1:2);
end


