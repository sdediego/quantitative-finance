function [t, Z] = Ito_Process_Simulation(Z0,T,M,N,a,b,varargin)
% Ito_Process_Simulation: Itô process dynamics simulation.
%
% SINTAXIS:
%  [t, Z] = Ito_Process_Simulation(Z0,T,M,N,a,b,varargin)
%
%      t : Time
%      Z : Process level
%      M : Number of simulated paths
%      N : Number of evaluations per path
%     Z0 : Process initial level
%      a : Drift
%      b : Stochastic component
%      T : Final time
%
% EXAMPLE:          
%  r0=3; alpha=0.5; r_inf=5; sigma=0.2; T=10; M=500; N=500;
%  [t,r] = Ito_Process_Simulation(r0,T,M,N,@Ito_Vasicek_Drift,@Ito_Vasicek_Stochastic,alpha,r_inf,sigma);
%  figure(1); plot(t',r'); hold on; 
%  plot(t(1,:),mean(r),'r','linewidth',3); hold off;
%
dT = T/N;
t = repmat((0:N)*dT,M,1);
Z(:,1) = Z0*ones(M,1);
X = randn(M,N);
for n=1:N
       Z(:,n+1) = Z(:,n)+...
           feval(a,Z(:,n),t(:,n),varargin{:})*dT + ...
           feval(b,Z(:,n),t(:,n),varargin{:})*sqrt(dT).*X(:,n);
end
end


