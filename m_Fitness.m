%% subfunction: fitness function
%------------------------------------------------------------------------%
% y = PiD+PiC*t+PiP*int[(P(v(t)),t,iRange_l,iRange_r] on 
% [iRange_l,iRange_r], the maximum value will not exceed 
% "iRange_r". So the distance from the function value to "iRange_r" is 
% calculated. The minimum distance is the optimal solution
% Fitness function = 1 / distance
%------------------------------------------------------------------------%
function fitness=m_Fitness(pop,iRange_r)
fitness=zeros(1,size(pop,2));
for n=1:size(pop,2)
    fitness(n)=1/(iRange_r-m_Fx(pop(:,n)));
end
end