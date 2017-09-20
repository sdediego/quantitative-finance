function price = priceForwardStartPutOption(S0,r,T0,T,sigma)
% priceForwardStartCallOption: Forward start put option price. 
% 
% SINTAXIS:  
%   price = priceForwardStartPutOption(S0,r,T0,T,sigma)
%
%  price : Forward start put option price
%     S0 : Underlying asset initial price
%     T0 : Time to receive call in-the-money (T0 < T)
%      r : Risk-free interest rate
%      T : Maturity time
%  sigma : Volatility
%
% EXAMPLE: 
%  S0 = 100; T0 = 1; r = 0.04; T = 2; sigma = 0.3;
%  priceForwardStartPutOption(S0,r,T0,T,sigma)
%
tau = T - T0;
S_T0 = S0*exp((r-0.5*sigma^2)*T0 + sigma*sqrt(T0));
d1 = ((r + 0.5*sigma^2))/(sigma*sqrt(tau));
d0 = d1 - sigma*sqrt(tau);
price = S_T0*(exp(-r*tau)*normcdf(-d0) - normcdf(-d1));
end