clear variables; % clear all variables
close all;       % close all figures
clc;             % clear console

format long      % print long numbers in console

f = @(x) (x-1).^-1;
a = 2;
b = 6;
exact_answer = log(5);

%Skapar en lista av antal indelningspunkter n. Vi väljer även bara de stora
%n värderna för att få bätte uppskattning i polyfit.
nvalues = [101, 501, 1001, 2001];

% Antal delinterval är n-1 och storleken h av ett delinterval är (b-a)/(n-1)
% Beräkna storleken h för varje n som en lista. Här används ./ för
% elementvis division.
hvalues = (b-a) ./ (nvalues-1);

% Beräkna summan för varje funktion och n som en lista
riemann_values = arrayfun(@(n) riemann(f, a, b, n), nvalues);
trapets_values = arrayfun(@(n) trapets(f, a, b, n), nvalues);
simpson_values = arrayfun(@(n) simpson(f, a, b, n), nvalues);

% Beräknar felet för integrationsmetoderna.
riemannfelet = abs(riemann_values-exact_answer);
trapetsfelet = abs(trapets_values-exact_answer);
simpsonfelet = abs(simpson_values-exact_answer);


% Räknar ut koefficienterna för riemannfelet, trapetsfelet och simpsonfelet
coefficients_riemann = polyfit(log(hvalues), log(riemannfelet), 1);
coefficients_trapets = polyfit(log(hvalues), log(trapetsfelet), 1);
coefficients_simpson = polyfit(log(hvalues), log(simpsonfelet), 1);
