function price = priceFlexoPutOption(S0f,Kf,rf,T,sigma,X)
% priceFlexoPutOption: Flexo put option price. 
% 
% SINTAXIS:  
%   price = priceFlexoPutOption(S0f,Kf,rf,T,sigma,X)
%
%   price: Flexo put option price
%    S0f : Underlying foreign asset initial price
%     Kf : Strike foreign price
%     rf : Risk-free foreign interest rate
%      T : Maturity time
%  sigma : Volatility
%      X : Exchange rate to domestic economy
%
% EXAMPLE: 
%  S0f = 100; Kf = 90; rf = 0.03; T = 2; sigmaf = 0.4; X = 1.3;
%  priceFlexoPutOption(S0f,Kf,rf,T,sigma,X)
%
d1 = (log(S0f/Kf) + (rf + 0.5*sigma^2)*T)/(sigma*sqrt(T));
d0 = d1 - sigma*sqrt(T);
call_foreign = Kf*exp(-rf*T)*normcdf(-d0) - S0f*normcdf(-d1);
price = X*call_foreign;
end