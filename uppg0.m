clear variables; % clear all variables
close all;       % close all figures
clc;             % clear console

format long      % print long numbers in console 

f = @(x) sin(x);
a = 0; b = pi/2;
exact_answer = 1;

% Skriv ut uppskattningen från Riemannsumman med 10 indeldningspunkter
riemann(f, a, b, 10)

% Vi vill nu se hur värdet av uppskattningen ändras när vi använder fler
% indeldningspunkter. Skapa en lista av antal indelningspunkter n.
nvalues = [10, 50, 100, 500, 1000];

% Beräkna Riemannsumman för varje n som en lista
riemann_values = arrayfun(@(n) riemann(f, a, b, n), nvalues);

% Antal delinterval är n-1 och storleken h av ett delinterval är (b-a)/(n-1)
% Beräkna storleken h för varje n som en lista. Här används ./ för
% elementvis division.
hvalues = (b-a) ./ (nvalues-1);


% Rita ut uppskattningen som funktion av storleken h för varje n
plot(hvalues, riemann_values, '*-')
xlabel("Intervallstorlek")
ylabel("Uppskattning av integralen")
grid on
hold on

% Rita ut exakt svar som en horisontell linje
yline(exact_answer, "red");

% Specificera y-axelns gränser (annars hamnade röda linjen i överkanten)
ylim([0.9, 1.1])

% Skriv ut förklaring av graferna
legend(["Riemannsumma", "Exakt svar"])


% Nedan följer kod för att exportera figuren som PDF

% Justera storleken på figuren som [bredd, höjd]
fig = gcf;
fig.Units = "centimeters";
fig.Position(3:4) = [16, 8];

% Om det behövs: förstora textstorleken i figuren. Behövdes ej här.
% fontsize(gca, scale=1.5)

% Exportera figuren som pdf
exportgraphics(fig, "uppg0.pdf")