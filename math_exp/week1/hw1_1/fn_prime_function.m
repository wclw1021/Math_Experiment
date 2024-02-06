function result = fn_prime_function(x, n)
    result = 1 + sum((-1).^((1:n)) .* (x.^(2*(1:n))) ./ factorial(2*(1:n)));
end
