function price = priceElfXPutOption(S0f,KX,rd,rf,T,sigmaS,sigmaX,X)
% priceElfXPutOption: Equity-linked foreign exchange put option price. 
% 
% SINTAXIS:  
%   price = priceElfXPutOption(S0f,KX,rd,rf,T,sigmaS,sigmaX,X)
%
%   price: Elf-X put option price
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
%  priceElfXPutOption(S0f,KX,rd,rf,T,sigmaS,sigmaX,X)
%
norm_sigmaS = sqrt(sum(abs(sigmaS).^2));
norm_sigmaX = sqrt(sum(abs(sigmaX).^2));
d1 = (log(X/KX) + (rd - rf + 0.5*norm_sigmaS^2)*T)/(norm_sigmaX*sqrt(T));
d0 = d1 - norm_sigmaX*sqrt(T);
price = S0f*(KX*exp((rf-rd)*T)*normcdf(-d0) - X*normcdf(-d1));
end