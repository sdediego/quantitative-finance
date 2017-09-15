function [price greeks] = priceGapCallOption(S0,K,X,r,T,sigma)
% priceGapCallOption: Gap option price and greeks. 
% Portfolio replication:
%  - Asset-or-nothing put option with strike K long position.
%  - Cash-or-nothing put option with strike K and cash X short position.
%
% SINTAXIS:  
%   [price greeks] = priceGapCallOption(S0,K,X,r,T,sigma)
%
%   price: Gap option price
% greeks : Gap option greeks
%     S0 : Underlying asset initial price
%      K : Strike price
%      X : Cash
%      r : Risk-free interest rate
%      T : Maturity time
%  sigma : Volatility
%
% EXAMPLE: 
%  S0 = 100; K = 90; X = ; r = 0.03; T = 2; sigma = 0.4;
%  priceGapCallOption(S0,K,X,r,T,sigma)
%
d1 = (log(S0/K) + (r + 0.5*sigma^2)*T)/(sigma*sqrt(T));
d0 = d1 - sigma*sqrt(T);
price = S0*normcdf(d1) - X*exp(-r*T)*normcdf(d0);

delta = normcdf(d1) + normpdf(d0)*exp(-r*T)*(K-X)/(sigma*S0*sqrt(T));
gamma = normpdf(d1)/(sigma*S0*sqrt(T)) + (X-K)*(d0-sigma*sqrt(T))*normpdf(d0)/(S0^2*sigma^2*T);
greeks = [delta gamma];
end