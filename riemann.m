function result = riemann(f, a, b, n)
    % f : funktion som ska integreras
    % a < b : integrationsintervall
    % n : antalet indelningspunkter inklusive ändpunkter 
    
    xvalues = linspace(a,b,n);
    yvalues = f(xvalues);

    N = n - 1; % antal delintervall
    h = (b-a) / N; % intervallstorlek

    result = 0;
    for i = 1:N
        result = result + h * yvalues(i);
    end
end