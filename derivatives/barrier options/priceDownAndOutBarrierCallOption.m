function price = priceDownAndOutBarrierCallOption(S0,K,r,T,sigma,H)
% priceDownAndOutBarrierCallOption: Down-and-out barrier option price. 
% 
% SINTAXIS:  
%   price = priceDownAndOutBarrierCallOption(S0,K,r,T,sigma,H)
%
%  price : Barrier option price
%     S0 : Underlying asset initial price
%      K : Strike price
%      r : Risk-free interest rate
%      T : Maturity time
%  sigma : Volatility
%      H : Barrier level (H < S0, H < K)
%
% EXAMPLE: 
%  S0 = 100; K = 90; r = 0.03; T = 2; sigma = 0.4; H = 80;
%  priceDownAndOutBarrierCallOption(S0,K,r,T,sigma,H)
%
mu = (r - 0.5*sigma^2);
d1 = (log(S0/K) + (r + 0.5*sigma^2))/(sigma*sqrt(T));
d0 = d1 - sigma*sqrt(T);
call = S0*normcdf(d1) - K*exp(-r*T)*normcdf(d0);
d1_d = (log((H^2/S0)/K) + (r + 0.5*sigma^2))/(sigma*sqrt(T));
d0_d = d1_d - sigma*sqrt(T);
call_discount = (H^2/S0)*normcdf(d1_d) - K*exp(-r*T)*normcdf(d0_d);
price = call - ((H/S0)^(2*mu/sigma^2))*call_discount;
end