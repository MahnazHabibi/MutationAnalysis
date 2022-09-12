function [Entropy] = Graph_Entropy(Adj)
[m,n]=size(Adj);
D=sum(Adj);
P=sum(D);
Entropy=0;
if P>0
    for i=1:n
        if D(i)>0
           P_i=D(i)/P;
           Entropy=Entropy-P_i*log(P_i);
        end
    end
end
end