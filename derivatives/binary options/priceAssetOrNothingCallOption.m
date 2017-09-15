function [price greeks] = priceAssetOrNothingCallOption(S0,K,r,T,sigma)
% priceAssetOrNothingCallOption: Asset-or-nothing option price and greeks. 
% 
% SINTAXIS:  
%   [price greeks] = priceAssetOrNothingCallOption(S0,K,r,T,sigma)
%
%   price: Asset-or-nothing option price
% greeks : Asset-or-nothing option greeks
%     S0 : Underlying asset initial price
%      K : Strike price
%      r : Risk-free interest rate
%      T : Maturity time
%  sigma : Volatility
%
% EXAMPLE: 
%  S0 = 100; K = 90; r = 0.03; T = 2; sigma = 0.4;
%  priceAssetOrNothingCallOption(S0,K,r,T,sigma)
%
d1 = (log(S0/K) + (r + 0.5*sigma^2)*T)/(sigma*sqrt(T));
price = S0*normcdf(d1);

delta = normpdf(d1) + normpdf(d1)/(sigma*sqrt(T));
gamma = (normpdf(d1)/(sigma*S0*sqrt(T)))*(1 - d1/(sigma*sqrt(T)));
theta = -(S0*normpdf(d1)/(2*sigma*sqrt(T^3)))*(log(S0/(K*exp((r+0.5*sigma^2)*T))));
vega = -(S0*normpdf(d1)/(sigma^2*sqrt(T)))*log(S0/(K*exp(-(r-0.5*sigma^2)*T)));
rho = S0*sqrt(T)*normpdf(d1)/sigma;
lambda = -S0*normpdf(d1)/(sigma*K*sqrt(T));
greeks = [delta gamma theta vega rho lambda];
end