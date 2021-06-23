function H=H_matrix(n)
k=(sqrt(n)-1)^2;
n1=sqrt(n);
k1=sqrt(k);
H=zeros(n-k,n);
for i=1:k1
    for j=1:n1
        H(i,j+(i-1)*n1)=1;
    end
end
for i=n1:n-k
    for j=1:k1+1:n
        H(i,j+i-n1)=1;
    end
end
end