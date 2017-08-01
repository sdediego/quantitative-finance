function [price, error] = CallEU_Basket_BS_MC(S10,s1,S20,s2,rho,K,r,T,M)

% Example:
% r = 0.05; T = 2; M = 1e4;
% S10 = 120;  s1 = 0.3; 
% S20 = 100;  s2 = 0.2;
% K = 190; rho = linspace(-1,1);
%
% [price, error] = CallEU_Basket_BS_MC(S10,s1,S20,s2,rho,K,r,T,M);
% figure(1); errorbar(rho, price, error) 
%
X1 = randn(M,1);
X2 = randn(M,1);
for i = 1:length(rho)
    S1T = S10*exp((r-0.5*s1^2)*T+s1*sqrt(T)*X1);
    Z2 = rho(i)*X1 + sqrt(1-rho(i)^2)*X2;
    S2T = S20*exp((r-0.5*s2^2)*T+s2*sqrt(T)*Z2);
    payoff = max(S1T+S2T-K, 0); 
    discountFactor = exp(-r*T);
    price(i) = discountFactor*mean(payoff);
    error(i) = discountFactor*std(payoff)/sqrt(M);
end



