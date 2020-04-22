%% subfunction: 
%------------------------------------------------------------------------%
function y = m_Fx(v)
PiD = 30 ;           % Discrete cost           [£]
PiC = 10 ;           % Discrete cost           [£]
PiP=50;
A = 4/3;             % Heating parameters      [°C/h]
Vmax = 5;                % Maximum temperature       [°C]
Vhigh = 4;               % Maximum temperature       [°C]
Vlow = 0;                % Maximum temperature       [°C]
Vmin = -1;               % Minimum temperature       [°C]
h=4;


if (v >= Vlow & v <= Vhigh)
    y=PiD+PiC*(v./A);
else 
    y=PiD+PiC*(v./A)+0.5*PiP*((v-h).^2/A);
end
%------------------------------------------------------------------------%