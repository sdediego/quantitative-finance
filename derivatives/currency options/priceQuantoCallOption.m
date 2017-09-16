function price = priceQuantoCallOption(S0f,Kf,rd,rf,T,sigmaS,sigmaX,X)
% priceQuantoCallOption: Quanto option price. 
% 
% SINTAXIS:  
%   price = priceQuantoCallOption(S0f,Kf,rd,rf,T,sigmaS,sigmaX,X)
%
%   price: Quanto option price
%    S0f : Underlying foreign asset initial price
%     Kf : Strike foreign price
%     rd : Risk-free domestic interest rate
%     rf : Risk-free foreign interest rate
%      T : Maturity time
% sigmaS : Underlying asset volatility
% sigmaX : Exchange rate volatility
%      X : Exchange rate
%
% EXAMPLE: 
%  S0f = 100; Kf = 90; rd = 0.03; rf = 0.02; T = 2; sigmaS = 0.4;
%  sigmaX = 0.4; X = 1.3;
%  priceQuantoCallOption(S0f,Kf,rd,rf,T,sigmaS,sigmaX,X)
%
prod_sigma = sum((sigmaX.*sigmaS));
norm_sigma = sqrt(sum(abs(sigmaS).^2));
d1 = (log(S0f/Kf) + (rf + 0.5*norm_sigma^2)*T)/(norm_sigma*sqrt(T));
d0 = d1 - norm_sigma*sqrt(T);
price = X*(S0f*exp((rf-rd-prod_sigma)*T)*normcdf(d1) - Kf*exp(-rd*T)*normcdf(d0));
end