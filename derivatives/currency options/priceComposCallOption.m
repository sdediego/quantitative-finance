function price = priceComposCallOption(S0f,Kd,rd,T,sigma,X)
% priceComposCallOption: Compos option price. 
% 
% SINTAXIS:  
%   price = priceComposCallOption(S0f,Kd,rd,T,sigma,X)
%
%   price: Compos option price
%    S0f : Underlying foreign asset initial price
%     Kd : Strike price
%     rd : Risk-free interest rate
%      T : Maturity time
%  sigma : Volatility
%      X : Exchange rate
%
% EXAMPLE: 
%  S0f = 100; Kd = 90; rd = 0.03; T = 2; 
%  sigma = [0.4 0.0; 0.0 0.3]; X = 1.3;
%  priceComposCallOption(S0f,Kd,rd,T,sigma,X)
%
S0d = X*S0f;
norm_sigma = sqrt(sum(abs(sigma).^2));
d1 = (log(S0d/Kd) + (rd + 0.5*norm_sigma^2)*T)/(norm_sigma*sqrt(T));
d0 = d1 - norm_sigma*sqrt(T);
price = S0d*normcdf(d1) - Kd*exp(-rd*T)*normcdf(d0);
end