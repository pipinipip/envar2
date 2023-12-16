function result = P(n, x)
    r = 2;
    result = 0;
    for k = 0:n
        result = result + sign3(k) * (-x/r).^k;
    end
end

function result = sign3(k)
    if mod(k,3) == 0
        result = 1;
    elseif mod(k,3) == 1
        result = -1;
    else
        result = 0;
    end
end