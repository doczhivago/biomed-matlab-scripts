% Here is a Matlab code snippet for generating a sample data set for a multivariate gaussian distribution 
% with a given covariance matrix, s, and zero mean vector, mu.

s=[25 -2 4;-2 4 1;4 1 9];
mu=[0 0 0];
R=chol(s);
N=500;
z=repmat(mu,N,1)+randn(N,3)*R;
scatter3(z(:,1),z(:,2),z(:,3));


% The randn generates an array of random numbers drawn from a 1-D gaussian distributions. 
% This is modified by a decomposition of the given covariance matrix using the Cholesky decompositon 
% and the desired mean is added. 
% The covariance matrix for the data set can be estimated using:

cc=(z'*z)/N;

% N can be varied to see the effect of having an increasing number of data points to estimate from 
% (estimate starts to converge to true covariance matrix). The multiple correlation coefficient can 
% be calculated from the estimated covariance matrix. The actual multiple correlation coefficient is .1326. 

cofactor = @(A, r, c) (-1)^(r+c)*det(A([1:r-1 r+1:end], [1:c-1 c+1:end]));
r2_1_23=1-(det(cc)/(cc(1,1)*cofactor(cc,1,1)))