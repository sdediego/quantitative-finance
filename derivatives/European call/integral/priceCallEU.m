function price = priceCallEU(S0,K,r,T,sigma)
% priceCallEU: European call price 
% 
% SINTAXIS:  
%   price = priceCallEU(S0,K,r,T,sigma)
%
%   price: European call price
%     S0 : Underlying asset initial price
%      K : Strike price
%      r : Risk-free interest rate
%      T : Expiration time
%  sigma : Volatility
%
% EXAMPLE: 
%  S0 = 100; K = 90; r = 0.03; T = 2; sigma = 0.4;
%  priceCallEU(S0,K,r,T,sigma)
%  blsprice(S0,K,r,T,sigma)
%  
discountFactor = exp(-r*T);
R = 10; tol = 1e-10;
price = discountFactor*quadl(@integrandCallEU,-R,R,tol,[],S0,K,r,T,sigma);