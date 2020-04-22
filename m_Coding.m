%% subfunction: Binary coding
%------------------------------------------------------------------------%
% Input:
% Pop(population)
% Pop_length(encoding length)
% Output:
% line k of dec2binpop
%------------------------------------------------------------------------%

function binpop=m_Coding(pop,pop_length,irange_l)
pop = round((pop-irange_l)*10^6);
for n = 1:size(pop,2)                        % Column cycle
    for k = 1:size(pop,1)                    % Line loop
        dec2binpop{k,n} = dec2bin(pop(k,n)); % Dec2bin is a character vector                        
        lengthPop=length(dec2binpop{k,n});   % Dec2binpop is a cell array
        for s = 1:pop_length-lengthPop       % Zero padding
            dec2binpop{k,n} = ['0' dec2binpop{k,n}];
        end
    end
    binpop{n} = dec2binpop{k,n};             % Take line k of dec2binpop
end