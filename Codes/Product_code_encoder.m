function Product_code_encoder(M)

l=length(M);
N=reshape(M,[sqrt(l),sqrt(l)]);
S=size(N); %S(1)=S(2)=number of rows or coloumn
s=S(1);

for j=1:s % j is for rows
    sum=0;
    for i=1:s % i is for coloumns
        sum=sum+N(j,i);
    end
    N(j,i+1)=mod(sum,2);
end

for i=1:s+1
    sum=0;
    for j=1:s
        sum=sum+N(j,i);
    end
    N(j+1,i)=mod(sum,2);
end

n=numberofelements(N);
N=reshape(N,[1,n]);
display(N);
end