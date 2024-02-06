function result = fn_function(x, n)
    result = x + sum((-1).^((1:n)) .* (x.^(2*(1:n)+1)) ./ factorial(2*(1:n)+1));
end
