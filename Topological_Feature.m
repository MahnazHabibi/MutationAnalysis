function[Feature,l,LS]=Topological_Feature(Gene)
% 6 opological features for each gene
% l laplacian Score for each feature
% Laplacian Score for each gene
Adj(573,573)=0;
for i=1:572
    for j=i+1:573
        A=Gene(i).case;
        B=Gene(j).case;
        a=length(A);
        b=length(B);
        c=mean([a,b]);
        if a>0
            if b>0
                Adj(i,j)=length(intersect(A,B))/c;
                Adj(j,i)=Adj(i,j);
            end
        end
    end
end
G = digraph(Adj);
G1 = graph(Adj);
Weight=sum(Adj);
PageRank = centrality(G, 'pagerank','Importance',G.Edges.Weight);
closeness= centrality(G,'outcloseness','Cost',G.Edges.Weight);
betweenness_Cost = centrality(G,'betweenness','Cost',G.Edges.Weight);
Eigenvector_Importance=centrality(G1,'eigenvector','Importance',G1.Edges.Weight);
[Entropy] = Graph_Entropy(Adj);
A2=Adj;
for i=1:573
L=setdiff([1:573],i);
A2=Adj(L,L);
e=Graph_Entropy(A2);
E(i,1)=abs(Entropy-e);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%
Feature(:,1)=Weight';
Feature(:,2)=closeness;
Feature(:,3)=betweenness_Cost;
Feature(:,4)=PageRank;
Feature(:,5)=Eigenvector_Importance;
Feature(:,6)=E;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[X]=Normal_matrix(Feature);
[Laplas]=LSFS(X,5,100);
l=Laplas';
LS=X*l*1000000;