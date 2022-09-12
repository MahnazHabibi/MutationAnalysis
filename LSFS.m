function[Laplas]=LSFS(X,k,t)
%%%%%%%%%%%%%%%%%%%%%Distance%%%%%%%%%%%%%%%%%%%%%%%%%
%k=50;
[n,m]=size(X);
O(n,n)=0;
for i=1:n-1
    for j=i+1:n
        O(i,j)=sqrt(sum((X(i,:)-X(j,:)).^2));
        O(j,i)=O(i,j);
    end
end
%k=mean(mean(O))
for i=1:n
    for j=1:n
        if O(i,j)>k
            S(i,j)=0;
        else
            S(i,j)=exp(-(O(i,j)^2)/t);
        end
    end
end
I(n,1)=1;
for i=1:n
    I(i,1)=1;
end
SI=S*I;
for i=1:n
    D(i,i)=SI(i);
end
L=D-S;
for r=1:m
    Fr=X(:,r);
    F=Fr-(((Fr'*L*I)/(I'*D*I))*I);
    a=(F'*L*F);
    b=(F'*D*F);
    Laplas(r)=a(1)/b(1);
end