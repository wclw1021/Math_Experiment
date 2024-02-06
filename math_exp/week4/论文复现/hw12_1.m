% p 和 q 坐标的初始化
p = [
    155, 30;  
    155, 125;
    155, 225;
    235, 100;
    235, 160;
    295, 85;
    293, 180
];
q = [
    211, 42;  
    155, 125;
    100, 235;
    235, 80;
    235, 140;
    295, 85;
    295, 180 
];

% 读取图像
image = imread('test.jpg');  % 替换为您的图像文件路径

% 获取图像的尺寸
[rows, cols, ~] = size(image);  % 考虑到彩色图像的第三个通道

% 获取每个像素的坐标
[X, Y] = meshgrid(1:rows, 1:cols);
pixel_coordinates = [X(:), Y(:)];  % 将坐标展开为一维数组

% 初始化变换后图像
D = zeros(rows,cols,2);
% 遍历每个像素的坐标，计算仿射变换
for i = 1:(rows * cols)
    x_coordinate = pixel_coordinates(i, 1);
    y_coordinate = pixel_coordinates(i, 2);
    
    % 调用 Precompute_Affine 函数来计算仿射变换
    %transformed_coordinate = Compute_Affine(p, q, [x_coordinate, y_coordinate]);
    % 调用 Precompute_Similar 函数来计算相似变换
    %transformed_coordinate = Compute_Similar(p, q, [x_coordinate, y_coordinate]);
    % 调用 Precompute_Rigid 函数来计算刚体变换
    transformed_coordinate = Compute_Rigid(p, q, [x_coordinate, y_coordinate]);
    % 更新变换后图像的像素颜色信息
        x = transformed_coordinate(1);
        y = transformed_coordinate(2);

       if isfinite(x) && isfinite(y)
           D(x_coordinate,y_coordinate,1) = -y+y_coordinate;
           D(x_coordinate,y_coordinate,2) = -x+x_coordinate;
       end     
end
transformed_image = imwarp(image,D,'FillValues',255);
% 显示或保存变换后的图像
transformed_image=rescale(uint16(transformed_image));
imshow(transformed_image);  % 显示图像
% imwrite(uint8(transformed_image), 'transformed_image.png');  % 保存图像





