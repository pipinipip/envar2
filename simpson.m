function result = simpson(f, a, b, n)
    % f : funktion som ska integreras
    % a < b : integrationsintervall
    % n : antalet indelningspunkter inklusive ändpunkter 
    
    if mod (n ,2) == 0
    error (" n should be odd !")
    end
    % Avslutar funktionen och säger error ifall n är jämn då simpson
    % funktionen inte klarar av jämna n.

    xvalues = linspace(a,b,n);
    yvalues = f(xvalues);

    N = n - 1; % antal delintervall
    h = (b-a) / N; % intervallstorlek

    result = 0;
    for i = 1:2:N-1
        result = result + h/3 * (yvalues(i)+4*yvalues(i+1)+yvalues(i+2));
    end
end