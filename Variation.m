%% Subfunction: Variation
%------------------------------------------------------------------------%
% Input:
% Pop population
% VARIATIONRATE
% Output:
% Pop mutated population
%------------------------------------------------------------------------%

function kidspop = Variation(kidspop,variationrate)
for n=1:size(kidspop,2)
    if rand<variationrate
        temp = kidspop{n};
        % Find the mutation location
        location = ceil(length(temp)*rand);
        temp = [temp(1:location-1) num2str(~temp(location))...
        temp(location+1:end)];
        kidspop{n} = temp;
    end
end