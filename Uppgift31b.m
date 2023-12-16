clear variables; % clear all variables
close all;       % close all figures
clc;             % clear console

format long      % print long numbers in console 

f = @(x) (x-1).^-1;
a = 2;
b = 6;
exact_answer = log(5);
%

% Vi vill nu se hur värdet av uppskattningen ändras när vi använder fler
% indeldningspunkter. Skapa en lista av antal indelningspunkter n.
nvalues = [5, 7, 11, 51, 101, 501, 1001, 2001];

% Beräkna summan för varje funktion och n som en lista
riemann_values = arrayfun(@(n) riemann(f, a, b, n), nvalues);
trapets_values = arrayfun(@(n) trapets(f, a, b, n), nvalues);
simpson_values = arrayfun(@(n) simpson(f, a, b, n), nvalues);

% Antal delinterval är n-1 och storleken h av ett delinterval är (b-a)/(n-1)
% Beräkna storleken h för varje n som en lista. Här används ./ för
% elementvis division.
hvalues = (b-a) ./ (nvalues-1);


% Rita ut uppskattningen som funktion av storleken h för varje n
hold on
plot(hvalues, riemann_values, '*-')
plot(hvalues, trapets_values, '*-')
plot(hvalues, simpson_values, '*-')
xlabel("Intervallstorlek")
ylabel("Uppskattning av integralen")
grid on

% Rita ut exakt svar som en horisontell linje
yline(exact_answer, "red");

% Specificera y-axelns gränser (annars hamnade röda linjen i överkanten)
ylim([1.5, 2.3])
xlim([0, 1.1])
% Skriv ut förklaring av graferna
legend(["riemann", "trapets" , "simpson", "Exakt svar"])


% Nedan följer kod för att exportera figuren som PDF

% Justera storleken på figuren som [bredd, höjd]
fig = gcf;
fig.Units = "centimeters";
fig.Position(3:4) = [16, 8];

% Om det behövs: förstora textstorleken i figuren. Behövdes ej här.
% fontsize(gca, scale=1.5)

% Exportera figuren som pdf
exportgraphics(fig, "uppgift2b.pdf")