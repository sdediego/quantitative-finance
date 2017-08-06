function [t, S] = Black_Scholes_Exponential_Mat(S0,mu,sigma,T,M,N)
% Black_Scholes_Exponential_Mat: Black-Scholes dynamics simulation.
%
% SINTAXIS:
%  [t, S] = Black_Scholes_Exponential_Mat(S0,mu,sigma,T,M,N)
%
%      t : Time
%      S : Asset value
%      M : Number of simulated paths
%      N : Number of evaluations per path
%     S0 : Underlying asset initial price
%     mu : Drift
%  sigma : Volatility
%      T : Expiration time
%
% EXAMPLE:
%  S0=100; mu=0.05; sigma=0.2; T=2; M=50; N=200;
%  [t,S] = Black_Scholes_Exponential_Mat(S0,mu,sigma,T,MM,NN);
%  figure(1); plot(t',S');
%
dT = T/N;
t = repmat((0:N)*dT,M,1);
X = randn(M,N);
S = [S0*ones(M,1) exp((mu-0.5*sigma^2)*dT+sigma*sqrt(dT)*X)];
S = cumprod(S,2);
end





