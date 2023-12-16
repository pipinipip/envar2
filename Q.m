function result = Q(n, x)
    r = 2;
    result = 0;
    for k = 0:n
        result = result + (x./-r).^k;
    end
end


