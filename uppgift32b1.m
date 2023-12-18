clear variables; % clear all variables
close all;       % close all figures
clc;             % clear console

format long      % print long numbers in console

%funktionen vi undersöker. stoppade även in r=2
f = @(x) 4 ./ (4-2*x+x^2);

%skapar en tom lista för att göra så att programmet mår bättre :)
A = zeros(0,100);
i=0;

%Skapar en list med alla heltal mellan 1 och 100 som kommer användas som x
%värden i plotten
N=(0:100);

%En loop för att skapa våra y värden till plotten
while i<=100
    A(i+1)=f(1.9)-P(i,1.9);
    i=i+1;
end

%skapar en plot
plot (N,A,"x")
legend('= r-0.1')

% Justera storleken på figuren som [bredd, höjd]
fig = gcf;
fig.Units = "centimeters";
fig.Position(3:4) = [16, 8];

% Exportera figuren som pdf
exportgraphics(fig, "uppgift32b1.pdf")
