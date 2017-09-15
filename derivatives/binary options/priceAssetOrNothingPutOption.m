function price = priceAssetOrNothingPutOption(S0,K,r,T,sigma)
% priceAssetOrNothingPutOption: Asset-or-nothing put option price. 
% 
% SINTAXIS:  
%   price = priceAssetOrNothingPutOption(S0,K,r,T,sigma)
%
%   price: Asset-or-nothing put option price
%     S0 : Underlying asset initial price
%      K : Strike price
%      r : Risk-free interest rate
%      T : Maturity time
%  sigma : Volatility
%
% EXAMPLE: 
%  S0 = 100; K = 90; r = 0.03; T = 2; sigma = 0.4;
%  priceAssetOrNothingPutOption(S0,K,r,T,sigma)
%
d1 = (log(S0/K) + (r + 0.5*sigma^2)*T)/(sigma*sqrt(T));
price =  S0*normcdf(-d1);
end