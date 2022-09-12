

"A new machine learning method for cancer mutation analysis"

Corresponding author: Golnaz Taheri (Email: golnazt@kth.se)
===============================================================================

# A method to construct mutation network and to calculate topological features.
Version 1.0

To construct mutation network, find the informative features and to calculate Laplacian Score for each feature in a new dataset, please prepare your input as the MATLAB .mat file in the following format:

Gene = 

  1×n struct array with fields:

    gene: Contain the list of n cancer mutated genes
    case: Contain the list of cases



for example:
Gene(1).gene='TP53'
Gene(1).case= {'TCGA-37-5819' , 'TCGA-37-A5EL' , 'TCGA-37-A5EM' , 'TCGA-37-A5EN'}

You can use "Genes_Cases.mat" file contain 573 cancer mutated genes and related their cases.

==============

The entry point of the code is the script Topological_Feature.m
To run the Topological_Feature.m, use the following arguments in MATLAB command line:

"[Feature_Matrix,LS]=Topological_Feature(Gene)"



The output files  contain two MATLAB files:

Feature_Matrix : each array of feature matrix  x_{ij} represents and the j-th feature of the i-th genes.

LS  :  The Laplacian Score for each feature.

===============================================================================

# An unsupervised machine learning method to calculate Laplacian Score for each cancer mutated gene.
Version 1.0

To calculate the Laplacian Score values in a new dataset, please prepare your input as the MATLAB .mat file.

The entry point of the code is the script LSFS.m
To run the LSFS.m, use the following arguments in MATLAB command line:

"[LS] = LSFS(X,Epsilon,threshold)"


X represents as feature matrix and Epsilon and threshold values between 0 to 100
 
The output file "LS" contains the Laplacian Score for each feature.

===============================================================================
