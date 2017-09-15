function [price greeks] = priceCashOrNothingCallOption(S0,K,r,T,sigma)
% priceCashNothingCallOption: Cash-or-nothing option price and greeks. 
% 
% SINTAXIS:  
%   [price greeks] = priceCashNothingCallOption(S0,K,r,T,sigma)
%
%   price: Cash-or-nothing option price
% greeks : Cash-or-nothing option greeks
%     S0 : Underlying asset initial price
%      K : Strike price
%      r : Risk-free interest rate
%      T : Maturity time
%  sigma : Volatility
%
% EXAMPLE: 
%  S0 = 100; K = 90; r = 0.03; T = 2; sigma = 0.4;
%  priceCashNothingCallOption(S0,K,r,T,sigma)
%
discountFactor = exp(-r*T);
d1 = (log(S0/K) + (r + 0.5*sigma^2)*T)/(sigma*sqrt(T));
d0 = d1 - sigma*sqrt(T);
price = discountFactor*normcdf(d0);

delta = discountFactor*normpdf(d0)/(sigma*S0*sqrt(T));
gamma = (-discountFactor*normpdf(d0)/(sigma*S0^2*sqrt(T)))*(1 + d0/(sigma*sqrt(T)));
theta = -discountFactor*(r*normcdf(d0) + (normpdf(d0)/(2*sigma*sqrt(T^3)))*log(S0/(K*exp((r-0.5*sigma^2)*T))));
vega = -(discountFactor*normpdf(d0)/(sigma^2*sqrt(T)))*log(S0/(K*exp(-(r+0.5*sigma^2)*T)));
rho = discountFactor*(sqrt(T)*normpdf(d0)/sigma - T*normcdf(d0));
lambda = -discountFactor*K*normpdf(d0)/(sigma*K*sqrt(T));
greeks = [delta gamma theta vega rho lambda];
end