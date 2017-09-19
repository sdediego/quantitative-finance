function [price, error] = priceCallOnCallOption(S0,K,K1,r,T,T1,sigma,M)
% priceCallOnCallOption: Call on call (CoC) option price. 
% 
% SINTAXIS:  
%   [price, error] = priceCallOnCallOption(S0,K,K1,r,T,T1,sigma,M)
%
%  price : CoC option price
%  error : Price error margin
%     S0 : Underlying asset initial price
%      K : Strike price
%     K1 : Strike price on option
%      r : Risk-free interest rate
%      T : Maturity time
%     T1 : Maturity time on option
%  sigma : Volatility
%      M : Number of simulated paths
%
% EXAMPLE: 
%  S0 = 100; K = 90; K1 = 95; r = 0.03; T = 2; T1 = 2; 
%  sigma = 0.4; M = 10000;
%  priceCallOnCallOption(S0,K,K1,r,T,T1,sigma,M)
%
x = randn(M,1);
S_T1 = S0*exp((r - 0.5*sigma^2) + sigma*sqrt(T1)*x);
call = blsprice(S_T1,K,r,(T-T1),sigma);
payoffs = max(call - K1,0);
discountFactor = exp(-r*T1);
price = discountFactor*mean(payoffs);
error = discountFactor*std(payoffs)/sqrt(M);
end