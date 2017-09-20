function price = priceChooserOption(S0,K,r,T0,T,sigma)
% priceChooserOption: Chooser option price. 
% 
% SINTAXIS:  
%   price = priceChooserOption(S0,K,r,T0,T,sigma)
%
%  price : Forward start put option price
%     S0 : Underlying asset initial price
%      K : Strike price
%     T0 : Time to decide between call or put option
%      r : Risk-free interest rate
%      T : Maturity time
%  sigma : Volatility
%
% EXAMPLE: 
%  S0 = 100; K = 90; T0 = 1; r = 0.04; T = 2; sigma = 0.3;
%  priceChooserOption(S0,K,r,T0,T,sigma)
%
d0 = (1/(sigma*sqrt(T)))*log(S0/(K*exp(-r*T))) - 0.5*sigma*sqrt(T);
d1 = d0 + sigma*sqrt(T);
d0_bar = (1/(sigma*sqrt(T0)))*log(S0/(K*exp(-r*T0))) - 0.5*sigma*sqrt(T);
d1_bar = d0_bar + sigma*sqrt(T0);
price = S0*(normcdf(d1) - normcdf(-d1_bar)) + K*exp(-r*T)*(normcdf(-d0_bar) - normcdf(d0));
end