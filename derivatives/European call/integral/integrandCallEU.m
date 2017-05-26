function y = integrandCallEU(x,S0,K,r,T,sigma)
% integrandCallEU: European call integrand 
% 
% SINTAXIS:  
%    y = integrandCallEU(x,S0,K,r,T,sigma)
%
%      y : Integrand value
%      x : Integration variable 
%     S0 : Underlying asset initial price
%      K : Strike price
%      r : Risk-free interest rate
%      T : Expiration time
%  sigma : Volatility
%
% EXAMPLE:
%  S0 = 100; K = 90; r = 0.03; T = 2; sigma = 0.4;
%  discountFactor = exp(-r*T);
%  R = 10; tol = 1e-6;
%  price = discountFactor*quadl(@integrandCallEU,-R,R,tol,[],S0,K,r,T,sigma)
%  blsprice(S0,K,r,T,sigma)
%
ST = S0*exp((r-0.5*sigma^2)*T + sigma*sqrt(T)*x);
payoff = max(ST-K,0);
y = normpdf(x).*payoff;
