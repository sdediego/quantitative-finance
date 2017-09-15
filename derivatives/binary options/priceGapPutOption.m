function price = priceGapPutOption(S0,K,X,r,T,sigma)
% priceGapCallOption: Gap put option price. 
% Portfolio replication:
%  - Asset-or-nothing put option with strike K short position.
%  - Cash-or-nothing put option with strike K and cash X long position.
%
% SINTAXIS:  
%   price = priceGapPutOption(S0,K,X,r,T,sigma)
%
%   price: Gap put option price
%     S0 : Underlying asset initial price
%      K : Strike price
%      X : Cash
%      r : Risk-free interest rate
%      T : Maturity time
%  sigma : Volatility
%
% EXAMPLE: 
%  S0 = 100; K = 90; X = ; r = 0.03; T = 2; sigma = 0.4;
%  priceGapPutOption(S0,K,X,r,T,sigma)
%
d1 = (log(S0/K) + (r + 0.5*sigma^2)*T)/(sigma*sqrt(T));
d0 = d1 - sigma*sqrt(T);
price = X*exp(-r*T)*normcdf(-d0) - S0*normcdf(-d1);
end