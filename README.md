# genatic-algorithm
The aim is to find the optimal temperature (v) that returns the minimum cost through GA.


%% Define units
%------------------------------------------------------------------------%
PiD = 30 ;               % Discrete cost             [£]
PiC = 10 ;               % Continuous cost           [£/h]
Pip = 50 ;               % Penalty cost              [£/h]

Vmax = 5;                % Maximum temperature       [°C]
Vhigh = 4;               % Maximum temperature       [°C]
Vlow = 0;                % Maximum temperature       [°C]
Vmin = -1;               % Minimum temperature       [°C]
h=4;                     % Safe zone

A = 4/3;                 % Heating parameters        [°C/h]
%------------------------------------------------------------------------%

The temperature function grows linearly from -1 to 5 as follows: 
x=0:0.01:2
for i=1:length(x)
v(i)=h+x(i);

      
cost function (y) is a quadratic cost function where y= PiD+PiC*(V(t)/A)+Pip int[P(V(t)),t,0,Vmax/A] ; where:
P(v(t))= V(t)-Vhigh    if Vhigh > V(t) <= Vmax
       = 0             if Vlow >= V(t) <= Vhigh       
       = Vlow-V(t)     if Vlow >  V(t) <= Vmin

Find the eithet the Opt t or V(t) that returns the minimum cost.



