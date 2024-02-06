function x_average = Voronoi_Shape_Center(inter)

    Areas = Voronoi_areas(inter);
    x = zeros(length(inter));
    x_sum = 0;
    floatage = Voronoi_Floatage(inter);
    for i = 1:length(inter)
        if ~isempty(inter{i, 1}.Vertices)
            x(i) = mean(inter{i, 1}.Vertices(:, 1));
        else
            x(i) = 0;
        end
        x_sum = x_sum + Areas(i) * x(i);
    end
    x_average = x_sum / floatage;
end

