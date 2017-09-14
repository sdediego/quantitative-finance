function [price, K0] = priceBreakforwardOption(S0,K,r,T,sigma)
% priceBreakforwardOption: Breakforward option price. 
% 
% SINTAXIS:  
%   [price, K0] = priceBreakforwardOption(S0,K,r,T,sigma)
%
%  price : Breakforward option price
%     K0 : Price for the null prime
%     S0 : Underlying asset initial price
%      K : Floor strike price
%      r : Risk-free interest rate
%      T : Maturity time
%  sigma : Volatility
%
% EXAMPLE: 
%  S0 = 100; K = 90; r = 0.03; T = 2; sigma = 0.4;
%  priceBreakforwardOption(S0,K,r,T,sigma)
%
F = S0*exp(r*T);
discountFactor = exp(-r*T);
d1 = (log(S0/F) + (r + 0.5*sigma^2))/(sigma*sqrt(T));
d0 = d1 - sigma*sqrt(T);
call = S0*normcdf(d1) - F*discountFactor*normcdf(d0);
price = call + discountFactor*(F - K);
K0 = exp(r*T)*S0*(1 + normcdf(d1) - normcdf(d0));
end