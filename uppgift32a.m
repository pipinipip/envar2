clear variables; % clear all variables
close all;       % close all figures
clc;             % clear console

format long      % print long numbers in console

%funktionen vi undersöker. stoppade även in r=2
f = @(x) 4 ./ (4-2*x+x^2);

%skapar funktionerna 
p0 = @(x) P(0, x);
p1 = @(x) P(1, x);
p3 = @(x) P(3, x);
p4 = @(x) P(4, x);
p6 = @(x) P(6, x);

%plottar funktionerna
fplot(p0,[-4 4])
hold on 
fplot(p1,[-4 4])
fplot(p3,[-4 4])
fplot(p4,[-4 4])
fplot(p6,[-4 4])
fplot(f,[-4 4])

ylim([0, 2])

%namnger alla funktioner
legend('p0','p1','p3','p4','p6','f')

% Justera storleken på figuren som [bredd, höjd]
fig = gcf;
fig.Units = "centimeters";
fig.Position(3:4) = [16, 8];

% Exportera figuren som pdf
exportgraphics(fig, "uppgift32a.pdf")