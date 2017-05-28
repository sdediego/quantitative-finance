function [price, error] = priceGeometricAsianCall_MC(S0,K,r,T,sigma,N,M)
% priceGeometricAsianCall_MC: Geometric mean Asian call option by Monte
% Carlo
%
% SINTAXIS: 
%  [price, error] = priceGeometricAsianCall_MC(S0,K,r,T,sigma,N,M)
%
%  price : Geometric Asian call price
%     S0 : Underlying asset initial price
%      K : Strike price
%      r : Risk-free interest rate
%      T : Expiration time
%  sigma : Volatility
%      N : Number of points for geometric average
%      M : Number of paths
%     
% EXAMPLE: 
%   S0 = 100; K = 110; r = 0.09; T = 1; sigma = 0.5; N = 52; M = 1e4;         
%   [price, error] = priceGeometricAsianCall_MC(S0,K,r,T,sigma,N,M)
%
dT = T/N;
X = randn(M,N);
S = cumprod([S0*ones(M,1) exp((r-sigma^2/2)*dT + sigma*sqrt(dT)*X)],2);
meanGeom = exp(mean(log(S(:,2:end)),2));
payoff = max(meanGeom-K,0);
discountFactor = exp(-r*T);
price = discountFactor*mean(payoff);
error = discountFactor*std(payoff)/sqrt(M);
       
