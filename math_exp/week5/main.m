% 从文本文件中读取数据
data = readmatrix('swanPolygon.txt');

% 提取 x 和 y 坐标
x = data(:, 1);
y = data(:, 2);

% 创建点集
boundary = [x, y];

%% 三角剖分
% % 三角剖分均匀生成
% points = Boundary_Points_Generate(boundary,50,50);
% insideTriangles = Boundary_Points_Delaunay(boundary,points);
% Delaunay_Depict(points,insideTriangles);
% prop = Proportion(boundary, points, insideTriangles); \\事先计算水中体积大小
% 
% % 三角剖分利用方程生成
[points,insideTriangles]=gen_mesh(boundary);
Directly_Depict(points,insideTriangles);
% 
% % 三角剖分进行非线性优化并计算新的质心
k_opt = NonlinearOptimization(points, insideTriangles);
ColorAndPlotTriangles(k_opt, insideTriangles, points,64);
[g_center_x, g_center_y] = Gravity_Center(k_opt, points, insideTriangles);

%%  Voronoi 剖分

% % 计算Voronoi图并绘制
% [points,insideTriangles]=gen_mesh(boundary);
% [v,c] = voronoin(points);
% % 遍历 c 中的索引
% for i = 1:numel(c)
%     % 删除 c{i} 中的值为 1 的数字
%     c{i} = c{i}(c{i} ~= 1);
% end
% inter = Voronoi_inter(v,c, boundary);
% Voronoi_Depict(v,c,boundary);
% % 
% % % 多变形剖分进行非线性优化并计算新的质心
% k_opt = Voronoi_NonlinearOpitimization(inter);
% Voronoi_Color(k_opt, inter, 64);
% [g_center_x, g_center_y] = Voronoi_Gravity_Center(k_opt,inter);











