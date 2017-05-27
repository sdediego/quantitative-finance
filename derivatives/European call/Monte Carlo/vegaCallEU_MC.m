function [vega, error] = vegaCallEU_MC(M,S0,K,r,T,sigma)
% vegaCallEU_MC: European call vega by Monte Carlo
%
% SINTAXIS:  
%  [vega, error] = vegaCallEU_MC(M,S0,K,r,T,sigma)
%
%   vega : European call vega
%  error : European call vega error
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
%  [vega, error] = vegaCallEU_MC(M,S0,K,r,T,sigma)
%  blsvega(S0,K,r,T,sigma)
%  
discountFactor = exp(-r*T);
X = randn(M,1);
h = 1e-5;  % Optimal balance between truncation errors
sigma_p = sigma*(1+h);
ST_p = S0*exp((r-0.5*sigma_p^2)*T + sigma_p*sqrt(T)*X);
payoff_p = max(ST_p-K,0);
sigma_m = sigma*(1-h);
ST_m = S0*exp((r-0.5*sigma_m^2)*T + sigma_m*sqrt(T)*X);
payoff_m = max(ST_m-K,0);
vega_path = (payoff_p-payoff_m)/(2*sigma*h); 
vega = discountFactor*mean(vega_path);
error = discountFactor*std(vega_path)/sqrt(M);
