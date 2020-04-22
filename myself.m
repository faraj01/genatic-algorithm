%% Functionality: 
% This program returns the optimal time (t) at which the cost is minimised
% using genatic Algorithms (GA).
%------------------------------------------------------------------------%
clear variables; 
close all;
clc;
%------------------------------------------------------------------------%

%% Define units
%------------------------------------------------------------------------%
PiD = 30 ;               % Discrete cost             [£]
PiC = 10 ;               % Continuous cost           [£/h]
Pip = 50 ;               % Continuous cost           [£/h]

Vmax = 5;                % Maximum temperature       [°C]
Vhigh = 4;               % Maximum temperature       [°C]
Vlow = 0;                % Maximum temperature       [°C]
Vmin = -1;               % Minimum temperature       [°C]
h=4;
A = 4/3;                 % Heating parameters        [°C/h]
A0 = -4;                 % Cooling parametersv       [°C/h]
%------------------------------------------------------------------------%

%% Genetic parameter setting
%------------------------------------------------------------------------%
%DeltaT = (Vmax/A)-(Vmin/A0);

NumPop = 100;            % Initial population size
iRange_l =0;             % lower problem-solving interval
iRange_r = Vmax/A;       % upper problem-solving interval
LENGTH=22;               % Binary code length
Iteration = 10000;       % Number of iterations
CrossoerRate = 0.7;      % Cross over rate
SelectRate=0.5;          % Selectivity
VariationRate = 0.001;   % Mutation rate
%------------------------------------------------------------------------%

%% Initial population
%------------------------------------------------------------------------%
pop = m_InitPop(NumPop,iRange_l,iRange_r);
%------------------------------------------------------------------------%

%% Plot the initial population distribution
%------------------------------------------------------------------------%
DeltaT = (Vmax/A)-(Vmin/A0);
x=linspace(iRange_l,iRange_r,100);   % Generating the initial population
v=zeros(1,length(x));
for i=1:length(x)
    v(i)=h+x(i);
end
y=m_Fx(v);
plot(x,y);
hold on
for i=1:size(pop,2)
    plot(pop(i),m_Fx(pop(i)),'ro');
end
hold off
title('Initial population');
%------------------------------------------------------------------------%
%% Start iteration
%------------------------------------------------------------------------%
for time = 1:Iteration
    % Fitness of initial population
    fitness = m_Fitness(pop,iRange_r); 
    % Select
    pop = m_Select(fitness,pop,SelectRate);
    % Binary coding
    BinPop = m_Coding(pop,LENGTH,iRange_l); 
    % Crossover
    kidspop = Crossover(BinPop,NumPop,CrossoerRate);    
    % Variation
    kidspop = Variation(kidspop,VariationRate);
    % Decoding
    kidspop=m_Incoding(kidspop,iRange_l);
    % Update population
    pop= [pop kidspop];
end
%------------------------------------------------------------------------%

%% Plot the optimal solution 
%------------------------------------------------------------------------%
figure
plot(x,y);
hold on
for i=1:size(pop,2)
    plot(pop(i),m_Fx(pop(i)),'ro');
end
hold off
title('Terminating population');
%------------------------------------------------------------------------%

%% Show optimal values
%------------------------------------------------------------------------%
disp(['Optimal solution = ' num2str(max(m_Fx(pop)))]);
disp(['Maximum fitness = ' num2str(max(m_Fitness(pop,iRange_r)))]);  