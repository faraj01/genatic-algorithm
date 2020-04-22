% subfunction: Select
%------------------------------------------------------------------------%
% Input: matrixFitness--fitness matrix
% pop--initial population
% SELECTRATE--selection rate
%------------------------------------------------------------------------%

function ParentPop = m_Select(MatrixFitness,pop,SelectRate)
ParentPop=[];
% Calculate fitness of all populations
SumFitness = sum(MatrixFitness(:));  
% Cumulative probability
accP=cumsum(MatrixFitness/SumFitness);
% Roulette selection algorithm
%------------------------------------------------------------------------%
% Find the cumulative probability greater than the random number
for n=1:round(SelectRate*size(pop,2))    
    matrix=find(accP>rand); 
    if isempty(matrix)
        continue
    end
    % Inherit the first individual at a position with a greater cumulative
    % probability than the random number
    ParentPop(:,n) = pop(:,matrix(1)); %#ok<*AGROW>
end
%------------------------------------------------------------------------%
end