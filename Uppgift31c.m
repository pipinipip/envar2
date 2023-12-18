clear variables; % clear all variables
close all;       % close all figures
clc;             % clear console

format long      % print long numbers in console

f = @(x) (x-1).^-1;
a = 2;
b = 6;
exact_answer = log(5);

%Skapar en lista av antal indelningspunkter n.
nvalues = [5, 7, 11, 51, 101, 501, 1001, 2001];

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

% Rita ut uppskattningen som funktion av storleken h för varje n
loglog(hvalues, riemannfelet, '*-')
hold on
loglog(hvalues, trapetsfelet, '*-')
loglog(hvalues, simpsonfelet, '*-')
xlabel("Intervallstorlek")
ylabel("felet")
grid on

% Skriv ut förklaring av graferna
legend(["fel för riemann", "fel för trapets" , "fel för simpson"])

% Justera storleken på figuren som [bredd, höjd]
fig = gcf;
fig.Units = "centimeters";
fig.Position(3:4) = [16, 8];

% Exportera figuren som pdf
exportgraphics(fig, "uppgift31c.pdf")



