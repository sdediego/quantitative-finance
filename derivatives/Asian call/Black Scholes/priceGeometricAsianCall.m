function price = priceGeometricAsianCall(S0,K,r,T,sigma,N) 
% priceGeometricAsianCall: Geometric mean Asian call option
%
% SINTAXIS: 
%  price = priceGeometricAsianCall(S0,K,r,T,sigma,N) 
%
%  price : Geometric Asian call price
%     S0 : Underlying asset initial price
%      K : Strike price
%      r : Risk-free interest rate
%      T : Expiration time
%  sigma : Volatility
%      N : Number of points for geometric average
%
% EXAMPLE:
%   S0 = 100; K = 110;r = 0.1; sigma = 0.25; T=2; N = 5;
%   price = priceGeometricAsianCall(S0,K,r,T,sigma,N) 
% 
r0 = r;
r = 0.5*(r.*(N+1)./N - sigma.^2*(1-1./N.^2)/6);
sigma = sigma.*sqrt((2*N.^2 + 3*N +1)./(6*N.^2));
d1 = (log(S0./K)+(r+sigma.^2/2).*T)./(sigma.*sqrt(T)); 
d0 = d1 - sigma.*sqrt(T);
price = exp(-r0.*T)*(S0.*exp(r.*T)*normcdf(d1)-K.*normcdf(d0)); 
