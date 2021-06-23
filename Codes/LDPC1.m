function LDPC1(H,c) %H is 2-D array and c is 1D array

d=size(H); %number of coloumns and rows in H. d(1)=rows d(2)=coloumns
k=0; % number of ones in a row in H
for i=1:d(2)
    if(H(1,i)==1)
        k=k+1;
    end
end
s=zeros(d(1),k); %initialing s with zeroes
for j=1:d(1) 
    k=1;
    for i=1:d(2)
        if(H(j,i)==1)
            s(j,k)=i; % storing the index where one occurs in the jth row of H
            k=k+1;
        end
    end
end

c_pre=0; % count of number of errors(-1) remaining in c in previous iteration 
c_cur=0; % count of number of errors(-1) remaining in c in current iteration


while(1) % loop runs until the number of errors do not chnage in 2 consecutive iterations i.e until c_pre and c_cur are different 

c_pre=c_cur; %c_cur(of former iteration) is now c_pre
c_cur=0; 
 for m=1:j % j is #rows in s
    c2=0;
    for n=1:k-1 %k-1 is #columns in s
        if(c(s(m,n))==-1) % this is the case when there is erased element
            c2=c2+1;
            c_cur=c_cur+1;  
            N=n;  %flag for the case when c2=1(only one erased element in row)
        end
    end
        sum=0;
        if(c2==1) % when there is only one erased element 
            for i=1:k-1 %traversal of one row of s
                sum=sum+c(s(m,i));
            end
            sum=mod(sum+1,2); % sum is increamented as -1 is also included in sum
           
            c(s(m,N))=sum; %error correction
            c_cur=c_cur-1; % one error is solved so c-cur decreases
        end
 end
 
 
 disp(c);
decodingSuccess=1;
for i=1:length(c)
    if(c(i)==-1)
        decodingSuccess=0;
     end
end
disp('DECODING STATUS');
disp(decodingSuccess);

 
end



end
 


    
    


