function [delta, error] = deltaCallEU_MC(M,S0,K,r,T,sigma)
% deltaCallEU_MC: European call delta by Monte Carlo 
% 
% SINTAXIS:  
%  [delta, error] = deltaCallEU_MC(M,S0,K,r,T,sigma)
%
%  delta : European call delta
%  error : European call delta error
%      M : Number of simulated paths
%     S0 : Underlying asset initial price
%      K : Strike price
%      r : Risk-free interest rate
%      T : Expiration time
%  sigma : Volatility
%
% EXAMPLE: 
%  S0 = 100; K = 90; r = 0.03; T = 2; sigma = 0.4;
%  M = 1e6;
%  [delta, error] = deltaCallEU_MC(M,S0,K,r,T,sigma)
%  
discountFactor = exp(-r*T);
X = randn(M,1);
aux = exp((r-0.5*sigma^2)*T + sigma*sqrt(T)*X);
h = 1e-5; % Optimal balance between truncation errors
ST_p = S0*(1+h)*aux; 
payoff_p = max(ST_p-K,0);
ST_m = S0*(1-h)*aux; 
payoff_m = max(ST_m-K,0);
delta_path = (payoff_p-payoff_m)/(2*S0*h);
delta = discountFactor*mean(delta_path);
error = discountFactor*std(delta_path)/sqrt(M);
