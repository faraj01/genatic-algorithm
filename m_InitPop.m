% subfunction: Initial population
%------------------------------------------------------------------------%
% Input: numpop--population size;
% [irange_l, irange_r]-the interval where the initial population is located
% population consists of a random number [irange_l, irange_r] matrix,
%------------------------------------------------------------------------%

function pop = m_InitPop(NumPop,iRange_l,iRange_r)
for i = 1:NumPop
    pop(:,i)=iRange_l+(iRange_r-iRange_l)*rand;
end
end