function BSC2(H,c)

h=size(H);
k1=0;
k2=0;
for i=1:length(c)
   if(H(1,i)==1)
    k1=k1+1;
   end
end
for i=1:h(1)
   if(H(i,1)==1)
    k2=k2+1;
   end
end
s1=zeros(h(1),k1);
s2=zeros(h(2),k2);
size_s1=size(s1);
size_s2=size(s2);
for i1=1:h(1)
    k=1;
    for j1=1:h(2)
        if(H(i1,j1)==1)
            s1(i1,k)=j1;
            k=k+1;
        end
    end
end
for i1=1:h(2)
    k=1;
    for j1=1:h(1)
        if(H(j1,i1)==1)
            s2(i1,k)=j1;
            k=k+1;
        end
    end
end
disp(s1);
disp(s2);
sum=0;m=1;
for i3=1:h(1)
    sum=0;
    for j3=1:size_s1(2)
        sum=sum+c(s1(i3,j3));
    end
    Check_Node(m)=mod(sum,2);
    m=m+1;
end
Check_Node
n=0;
while(n<250)
    n=n+1;
    for i4=1:length(c)
        k=0;
        for j4=1:size_s2(2)
            if(s2(i4,j4)~=0)
                if(Check_Node(s2(i4,j4))==1)
                    k=k+1;
                else
                    k=k-1;
                end
            end
        end
            if(k>0)
                if(c(i4)==1)
                    c(i4)=0;
                else
                    c(i4)=1;
                end
                for i=1:size_s2(2)
                    if(s2(i4,i))
                    if(Check_Node(s2(i4,i))==0)
                        Check_Node(s2(i4,i))=1;
                    else
                        Check_Node(s2(i4,i))=0;
                    end
                    end
                end
            end
    end    
end
Check_Node
c
n
end