function H=H_matrix(n)
k=(sqrt(n)-1)^2;
n1=sqrt(n);
k1=sqrt(k);
H=zeros(n-k,n);
for row=1:k1
    for column=1:n1
        H(row,column+(row-1)*n1)=1;
    end
end
for row=n1:n-k
    for column=1:k1+1:n
        H(row,column+row-n1)=1;
    end
end
end