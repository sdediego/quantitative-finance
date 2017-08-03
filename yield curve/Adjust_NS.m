function [b0,b1,b2,tau] = Adjust_NS(t,r,pars0)
% Adjust_NS: Adjust the parameters for the Nelson-Siegel model. 
%
% EXAMPLE:
%  t = [ 0; 1/12; 3/12; 6/12;   1;  3; 10];
%  r = [ 5;   4 ;  3.5;  4.5; 5.1;6.0; 6.2]; 
%  pars0 = [6.2 -1.2 0.0 1];
%  [b0,b1,b2,tau] = Adjust_NS(t,r,pars0);    
% 
%  nPlot = 1000;   
%  tPlot = linspace(t(1),t(end)*1.1,nPlot); 
%  rNSPlot = Nelson_Siegel(tPlot,b0,b1,b2,tau);
%  figure(1); plot(t,r,'rx',tPlot,rNSPlot);
%
pars = fminunc(@MSE_NS,pars0,[],t,r); 
b0 = pars(1); b1 = pars(2); b2 = pars(3); tau = pars(4);
end