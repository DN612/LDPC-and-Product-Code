function d=productCode(N)
len=(length(N)).^(0.5);
for total_iter=1:(len.^2).^2           %Total number of iterations
    for row=0:len-2                      %This loop is for process of row
        error=0;                           %k denotes number of errors in row
        for column=1:len
            if(N(row.*(len)+column)==-1)
                error=error+1;
                indx=row.*(len)+column;    %Indx will show the index last error we find in row
            end
        end
        if(error==1)                % if in a row there is only one error then we will correct it
             ans=0;
             for column=1:len
                 if(N(row.*(len)+column)~=-1)
                     ans=ans+N(row.*(len)+column);
                 end
             end
             N(indx)=mod(ans,2); %Changing value of error bit
        end
    end
    
    breaker=0;                   %Breaking condition
    for column=1:len             %This loop is for column
        error=0;
        for row=0:len-1
            if(N(row.*(len)+column)==-1)
                error=error+1;
                breaker=breaker+1;
                indx=column+row.*(len);
            end
        end
        if(error==1)
            ans=0;
            for row=0:len-1
                 if(N(column+row.*(len))~=-1)
                     ans=ans+N(column+row.*(len));
                 end
            end
            N(indx)=mod(ans,2);
        end
    end
    if(breaker==0)
        break;
end
d=N;
end