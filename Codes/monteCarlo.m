function monteCarlo(H,C,noExp)
clc;
i_array=0;
for generatingError=1:length(C)
    errorCorrected=noExp;
    for totalExp=1:noExp
        c=C;
        randNo=randperm(length(C),generatingError);
        c(randNo)=-1;
        d=size(H); %number of coloumns and rows in H. d(1)=rows d(2)=coloumns
rowsH=0; % number of ones in a row in H
for i=1:d(2)
    if(H(1,i)==1)
        rowsH=rowsH+1;
    end
end

s=zeros(d(1),rowsH); %initialing s with zeroes
for rows=1:d(1) 
    k=1;
    for column=1:d(2)
        if(H(rows,column)==1)
            s(rows,k)=column; % storing the index where one occurs in the jth row of H
            k=k+1;
        end
    end
end

c_pre=0; % count of number of errors(-1) remaining in c in previous iteration 
c_cur=0; % count of number of errors(-1) remaining in c in current iteration

decodingSuccess=0;
while(1) % loop runs until the number of errors do not chnage in 2 consecutive iterations i.e until c_pre and c_cur are different
c_pre=c_cur; %c_cur(of former iteration) is now c_pre
c_cur=0; 
 for rowsS=1:rows % j is #rows in s
    errors=0;
    for n=1:k-1 %k-1 is #columns in s
        if(c(s(rowsS,n))==-1) % this is the case when there is erased element
            errors=errors+1;
            c_cur=c_cur+1;  
            N=n;  %flag for the case when errors=1(only one erased element in row)
        end
    end
        sum=0;
        if(errors==1) % when there is only one erased element 
            for i=1:k-1 %traversal of one row of s
                sum=sum+c(s(rowsS,i));
            end
            sum=mod(sum+1,2); % sum is increamented as -1 is also included in sum
           
            c(s(rowsS,N))=sum; %error correction
            c_cur=c_cur-1; % one error is solved so c-cur decreases
        end
 end
 if(c_pre==c_cur) %stoping condition for while loop
     break;
 end
            decodingSuccess=0;
            for i=1:length(c)
                if(c(i)==-1)
                    decodingSuccess=1;
                end
            end
        end
        errorCorrected=errorCorrected-decodingSuccess;
    end

    i_array=i_array+1;
    b(i_array)=errorCorrected/noExp;
    
   % stem(generatingError,errorCorrected/noExp);
    %xlabel("Number of errors");
    %ylabel("Probability of decoding success");
    %hold on;
end

x=1:length(C);
plot(x,b);
end
