function price = pricePortfolioInsuranceOption(S0,K,r,T,sigma,alpha,beta)
% precioPortfolioInsurance: Portfolio insurance option price. 
% 
% SINTAXIS:  
%   price = pricePortfolioInsuranceOption(S0,K,r,T,sigma,alpha,beta)
%
%   price: Portfolio insurance option price
%     S0 : Underlying asset initial price
%      K : Strike price
%      r : Risk-free interest rate
%      T : Maturity time
%  sigma : Volatility
%  alpha : Upside capture coefficient
%   beta : Upside gain coefficient
%
% EXAMPLE: 
%  S0 = 100; K = 90; r = 0.03; T = 2; sigma = 0.4; alpha = ; beta = ;
%  pricePortfolioInsuranceOption(S0,K,r,T,sigma,alpha,beta)
%
discountFactor = exp(-r*T);
strike = (K - S0*(1 - beta))/(alpha*beta);
d1 = (log(S0/strike) + (r + 0.5*sigma^2))/(sigma*sqrt(T));
d0 = d1 - sigma*sqrt(T);
call = S0*normcdf(d1) - strike*discountFactor*normcdf(d0);
price = K*discountFactor + alpha*beta*call;
end