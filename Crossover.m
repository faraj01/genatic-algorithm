%% subfunction: Crossover
%------------------------------------------------------------------------%
% Input:
% ParentsPop previous generation population
% NUMPOP population size
% CROSSOVERRATE
% Output:
% KidsPop Next generation population
%------------------------------------------------------------------------%

function KidsPop = Crossover(ParentsPop,NumPop,CrossoverRate)
KidsPop = {[]};n = 1;
while size(KidsPop,2)<NumPop-size(ParentsPop,2)
    % Select the cross parent and mother
    father = ParentsPop{1,ceil((size(ParentsPop,2)-1)*rand)+1};
    mother = ParentsPop{1,ceil((size(ParentsPop,2)-1)*rand)+1};
    % Randomly generated cross positions
    CrossLocation = ceil((length(father)-1)*rand)+1;
    %If the random number is lower than the crossover rate, hybridise
    if rand<CrossoverRate
        father(1,CrossLocation:end) = mother(1,CrossLocation:end);
        KidsPop{n} = father;
        n = n+1;
    end
end