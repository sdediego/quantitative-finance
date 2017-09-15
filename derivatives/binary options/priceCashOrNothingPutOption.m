function price = priceCashOrNothingPutOption(S0,K,r,T,sigma)
% priceCashOrNothingPutOption: Cash-or-nothing put option price. 
% 
% SINTAXIS:  
%   price = priceCashOrNothingPutOption(S0,K,r,T,sigma)
%
%   price: Cash-or-nothing option price
%     S0 : Underlying asset initial price
%      K : Strike price
%      r : Risk-free interest rate
%      T : Maturity time
%  sigma : Volatility
%
% EXAMPLE: 
%  S0 = 100; K = 90; r = 0.03; T = 2; sigma = 0.4;
%  priceCashOrNothingPutOption(S0,K,r,T,sigma)
%
discountFactor = exp(-r*T);
d1 = (log(S0/K) + (r + 0.5*sigma^2)*T)/(sigma*sqrt(T));
d0 = d1 - sigma*sqrt(T);
price = discountFactor*normcdf(-d0);
end