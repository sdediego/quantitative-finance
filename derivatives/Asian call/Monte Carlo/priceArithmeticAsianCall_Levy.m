function [price, error] = priceArithmeticAsianCall_Levy(S0,K,r,T,sigma,N,M)
% priceArithmeticAsianCall_LevyApproximation: Arithmetic mean Asian call 
% option within Levy approximation.
%
% SINTAXIS: 
%  [price, error] = priceArithmeticAsianCall_Levy(S0,K,r,T,sigma,N,M) 
%
%  price : Arithmetic Asian call price
%  error : Arithmetic Asian call error
%     S0 : Underlying asset initial price
%      K : Strike price
%      r : Risk-free interest rate
%      T : Expiration time
%  sigma : Volatility
%      N : Number of points for arithmetic average
%      M : Number of paths
%
% EXAMPLE:
%   S0 = 100; K = 110; r = 0.1; sigma = 0.25; T=2; N = 5; M = 5000;
%   [price, error] = priceArithmeticAsianCall_Levy(S0,K,r,T,sigma,N,M) 
% 
dt = T/N;
X = randn(M,N);
S = cumprod([S0*ones(M,1) exp((r-sigma^2/2)*dt + sigma*sqrt(dt)*X)],2);
meanArit =  mean(S(:,2:end),2);
% Levy approximation
alpha = 2*log(meanArit) - 0.5*log(meanArit.^2);
beta = sqrt(log(meanArit.^2) - 2*log(meanArit));
expectArit = exp(alpha + 0.5*beta.^2);
payoff = max(expectArit-K,0);
discountFactor = exp(-r*T);
price = discountFactor*mean(payoff);
error = discountFactor*std(payoff)/sqrt(M);
end