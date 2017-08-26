function [price, error] = priceArithmeticAsianCall_KemmaVorst(S0,K,r,T,sigma,N,M) 
% priceArithmeticAsianCall_KemmaVorst: Arithmetic mean Asian call option 
% within Kemma-Vorst approximation.
%
% SINTAXIS: 
%  [price, error] = priceArithmeticAsianCall_KemmaVorst(S0,K,r,T,sigma,N,M) 
%
%  price : Arithmetic Asian call price
%  error : Arithmetic Asian call error
%     S0 : Underlying asset initial price
%      K : Strike price
%      r : Risk-free interest rate
%      T : Expiration time
%  sigma : Volatility
%      N : Number of points for arithmetic average
%      M : Number of paths
%
% EXAMPLE:
%   S0 = 100; K = 110; r = 0.1; sigma = 0.25; T=2; N = 5; M = 5000;
%   [price, error] = priceArithmeticAsianCall_KemmaVorst(S0,K,r,T,sigma,N,M) 
% 
dt = T/N;
X = randn(M,N);
S = cumprod([S0*ones(M,1) exp((r-sigma^2/2)*dt + sigma*sqrt(dt)*X)],2);
meanArit =  mean(S(:,2:end),2);
meanGeom =  exp(mean(log(S(:,2:end)),2));
% Kemma-Vorst approximation
K = K.*ones(size(meanGeom)) - (meanArit - meanGeom);
r_tilde = 0.5*(r*(N + 1)/N - ((sigma^2)*(1 - 1/N^2))/6);
sigma_tilde = sigma*sqrt((2*N^2 + 3*N + 1)/(6*N^2));
d1 = (log(S0./K) + ones(size(meanGeom)).*(r_tilde + 0.5*sigma_tilde^2)*T)/(sigma_tilde*sqrt(T)); 
d0 = d1 - sigma_tilde*sqrt(T);
aux_values = S0*exp(r_tilde*T).*normcdf(d1) - K.*normcdf(d0);
discountFactor = exp(-r*T);
price = discountFactor*mean(aux_values);
error = discountFactor*std(aux_values)/sqrt(M);
end
