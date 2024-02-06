function Boundary_Points_Voronoi(boundary,points)
    
    % 进行 Delaunay 三角剖分
    insideTriangles = Boundary_Points_Delaunay(boundary,points);
    voronoi(points(:,1),points(:,2),insideTriangles);
end

