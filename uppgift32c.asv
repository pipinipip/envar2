clear variables; % clear all variables
close all;       % close all figures
clc;             % clear console

format long      % print long numbers in console

%skapar funktionerna Gn(x) från n=1 till n=5
G1= @(x) abs((x./(-2)).^2)-abs(2./(2+x)-Q(1,x));
G2= @(x) abs((x./(-2)).^3)-abs(2./(2+x)-Q(2,x));
G3= @(x) abs((x./(-2)).^4)-abs(2./(2+x)-Q(3,x));
G4= @(x) abs((x./(-2)).^5)-abs(2./(2+x)-Q(4,x));
G5= @(x) abs((x./(-2)).^6)-abs(2./(2+x)-Q(5,x));

%plottar alla funktioner
fplot(G1,[0 2])
hold on 
fplot(G2,[0 2])
fplot(G3,[0 2])
fplot(G4,[0 2])
fplot(G5,[0 2])

%namnger de 5 olika funktionerna
legend('n=1','n=2','n=3','n=4','n=5')