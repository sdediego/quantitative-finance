function [price, error] = priceUpAndOutBarrierCallOption_MC(S0,K,r,T,sigma,H,N,M)
% priceUpAndOutBarrierCallOption_MC: Down-and-out barrier option price. 
% 
% SINTAXIS:  
%  [price, error] = priceUpAndOutBarrierCallOption_MC(S0,K,r,T,sigma,H,N,M)
%
%  price : Barrier option price
%  error : Barrier option price error margin
%     S0 : Underlying asset initial price
%      K : Strike price
%      r : Risk-free interest rate
%      T : Maturity time
%  sigma : Volatility
%      H : Barrier level (H > S0, H > K)
%      N : Number of points per path
%      M : Number of simulated paths
%
% EXAMPLE: 
%  S0 = 100; K = 90; r = 0.03; T = 2; sigma = 0.4; 
%  H = 110; N = 1000; M = 10000;
%  priceUpAndOutBarrierCallOption_MC(S0,K,r,T,sigma,H,N,M)
%
dt = T/N;
X = randn(M,N);
S = cumprod([S0*ones(M,1) exp((r-sigma^2/2)*dt + sigma*sqrt(dt)*X)],2);
barrier_up = ones(size(S)).*H;
Mat_ind = S < barrier_up;  
S_valid = S.*cumprod(ones(size(S)).*Mat_ind,2);
payoff = max(S_valid(:,end)-K,0);
price = exp(-r*T)*mean(payoff);
error = exp(-r*T)*std(payoff)/sqrt(M);
end
