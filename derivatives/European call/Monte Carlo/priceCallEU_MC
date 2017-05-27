function [price, error] = priceCallEU_MC(M,S0,K,r,T,sigma)
% priceCallEU_MC: European call price by Monte Carlo
% 
% SINTAXIS:  
%   [price, error] = priceCallEU_MC(M,S0,K,r,T,sigma)
%
%  price : European call price
%  error : European call price error
%      M : Number of simulated paths
%     S0 : Underlying asset initial price
%      K : Strike price
%      r : Risk-free interest rate
%      T : Expiration time
%  sigma : Volatility
%
% EXAMPLE: 
%  S0 = 100; K = 90; r = 0.03; T = 2; sigma = 0.4;
%  M = 1e4;
%  [price, error] = priceCallEU_MC(M,S0,K,r,T,sigma)
%  blsprice(S0,K,r,T,sigma)
%  
discountFactor = exp(-r*T);
X = randn(M,1);
ST = S0*exp((r-0.5*sigma^2)*T + sigma*sqrt(T)*X);
payoff = max(ST-K,0);
price = discountFactor*mean(payoff);
error = discountFactor*std(payoff)/sqrt(M);
