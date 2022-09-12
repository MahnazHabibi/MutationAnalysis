function[X]=Normal_matrix(Features_Matrix)
S=sum(Features_Matrix);
[m,n]=size(Features_Matrix);
for i=1:m
    B=Features_Matrix(i,:)./S;
    X(i,:)=B;
end