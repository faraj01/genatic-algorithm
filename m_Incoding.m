%% subfunction: incoding function
%------------------------------------------------------------------------%

function pop=m_Incoding(binPop,irange_l)
%pop=zeros(1,length(binPop));
popNum = 1;                 % # of parameters contained in the chromosome
for n=1:size(binPop,2)
    Matrix = binPop{1,n};
    for num=1:popNum
        pop(num,n) = bin2dec(Matrix);
    end
end
pop = pop./10^6+irange_l;
%------------------------------------------------------------------------%