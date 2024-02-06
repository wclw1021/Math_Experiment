function output_vector = rotate_vector(input_vector, theta, root_vector)
    % 输入向量 [x, y]
    x = input_vector(1);
    y = input_vector(2);
    z(1) = root_vector(1);
    z(2) = root_vector(2);
    % 构建旋转矩阵 R
    R = [cos(theta), -sin(theta); sin(theta), cos(theta)];

    % 计算输出向量 R*[x-z,y]+[z,0]
    result_vector = R * ([x - z(1); y - z(2)]) + [z(1); z(2)];

    output_vector = result_vector';
end
