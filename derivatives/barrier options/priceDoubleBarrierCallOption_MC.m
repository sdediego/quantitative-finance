function [price, error] = priceDoubleBarrierCallOption_MC(S0,K,r,T,sigma,B,b,N,M)
% priceDownAndOutBarrierCallOption: Double barrier option price. 
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
%      B : Top barrier level (B > S0, B > K)
%      b : Bottom barrier level (b < S0, b < K)
%      N : Number of points per path
%      M : Number of simulated paths
%
% EXAMPLE: 
%  S0 = 100; K = 90; r = 0.03; T = 2; sigma = 0.4; 
%  B = 110; b = 80; N = 1000; M = 10000;
%  priceDoubleBarrierCallOption_MC(S0,K,r,T,sigma,B,b,N,M)
%
dt = T/N;
X = randn(M,N);
S = cumprod([S0*ones(M,1) exp((r-sigma^2/2)*dt + sigma*sqrt(dt)*X)],2);
barrier_up = ones(size(S)).*B;
barrier_down = ones(size(S)).*b;
Mat_ind = (S < barrier_up) & (S > barrier_down);
S_valid = S.*cumprod(ones(size(S)).*Mat_ind,2);
payoff = max(S_valid(:,end)-K,0);
price = exp(-r*T)*mean(payoff);
error = exp(-r*T)*std(payoff)/sqrt(M);
end