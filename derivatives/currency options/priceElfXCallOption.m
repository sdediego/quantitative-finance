function price = priceElfXCallOption(S0f,KX,rd,rf,T,sigmaS,sigmaX,X)
% priceElfXCallOption: Equity-linked foreign exchange call option price. 
% 
% SINTAXIS:  
%   price = priceElfXCallOption(S0f,KX,rd,rf,T,sigmaS,sigmaX,X)
%
%   price: Elf-X option price
%    S0f : Underlying foreign asset initial price
%     KX : Strike exchange rate
%     rd : Risk-free domestic interest rate
%     rf : Risk-free foreign interest rate
%      T : Maturity time
% sigmaS : Underlying asset volatility
% sigmaX : Exchange rate volatility
%      X : Exchange rate
%
% EXAMPLE: 
%  S0f = 100; KX = 90; rd = 0.03; rf = 0.02; T = 2; 
%  sigmaS = 0.4; sigmaX = 0.4; X = 1.3;
%  priceElfXCallOption(S0f,KX,rd,rf,T,sigmaS,sigmaX,X)
%
norm_sigmaS = sqrt(sum(abs(sigmaS).^2));
norm_sigmaX = sqrt(sum(abs(sigmaX).^2));
d1 = (log(X/KX) + (rd - rf + 0.5*norm_sigmaS^2)*T)/(norm_sigmaX*sqrt(T));
d0 = d1 - norm_sigmaX*sqrt(T);
price = S0f*(X*normcdf(d1) - KX*exp((rf-rd)*T)*normcdf(d0));
end
