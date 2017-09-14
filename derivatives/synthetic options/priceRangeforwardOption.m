function price = priceRangeforwardOption(S0,K1,K2,r,T,sigma)
% priceRangeforwardOption: Rangeforward option price. 
% 
% SINTAXIS:  
%   price = priceRangeforwardOption(S0,K1,K2,r,T,sigma)
%
%  price : Rangeforward option price
%     S0 : Underlying asset initial price
%     K1 : Floor strike price
%     K2 : Ceil strike price
%      r : Risk-free interest rate
%      T : Maturity time
%  sigma : Volatility
%
% EXAMPLE: 
%  S0 = 100; K1 = 80; K2 = 90; r = 0.03; T = 2; sigma = 0.4;
%  priceRangeforwardOption(S0,K1,K2,r,T,sigma)
%
d1_1 = (log(S0/K2) + (r + 0.5*sigma^2))/(sigma*sqrt(T));
d0_1 = d1_1 - sigma*sqrt(T);
call = S0*normcdf(d1_1) - K2*exp(-r*T)*normcdf(d0_1);
d1_2 = (log(S0/K1) + (r + 0.5*sigma^2))/(sigma*sqrt(T));
d0_2 = d1_2 - sigma*sqrt(T);
put = K1*exp(-r*T)*normcdf(-d0_2) - S0*normcdf(-d1_2);
price = S0 - S0*exp(r*T) + put - call;
end