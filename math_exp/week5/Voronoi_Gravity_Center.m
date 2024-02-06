function [x_average, y_average] = Voronoi_Gravity_Center(k, inter)
    Areas = Voronoi_areas(inter);
    gravity = Voronoi_Gravity(k, inter);
    x = zeros(1, length(inter));
    y = zeros(1, length(inter));
    x_sum = 0;
    y_sum = 0;
    for i = 1:length(inter)
        if ~isempty(inter{i, 1}.Vertices)
            x(i) = mean(inter{i, 1}.Vertices(:, 1));
            y(i) = mean(inter{i, 1}.Vertices(:, 2));
        else
            x(i) = 0;
            y(i) = 0;
        end
        x_sum = x_sum + k(i) * Areas(i) * x(i);
        y_sum = y_sum + k(i) * Areas(i) * y(i);
    end
    x_average = x_sum / gravity;
    y_average = y_sum / gravity;
end


