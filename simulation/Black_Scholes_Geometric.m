function [t, S] = Black_Scholes_Geometric(S0,mu,sigma,T,M,N)
% Black_Scholes_Geometric: Black-Scholes dynamics simulation.
%
% SINTAXIS:
%  [t, S] = Black_Scholes_Geometric(S0,mu,sigma,T,M,N)
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
%  S0=100; mu=0.15; sigma=0.2; T=10; M=100; N=500;
%  [t,S] = Black_Scholes_Geometric(S0,mu,sigma,T,M,N);
%  figure(1); plot(t',S');  hold on;
%  plot(t(1,:),mean(S),'r','linewidth',3); hold off;
%
dT = T/N;
t = repmat((0:N)*dT,M,1);
S(:,1) = S0*ones(M,1);
X = randn(M,N);
for n=1:N
       S(:,n+1) = S(:,n).*(1+mu*dT+sigma*sqrt(dT)*X(:,n));
end
end