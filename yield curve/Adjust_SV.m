function [b0,b1,b2,tau1,b3,tau2] = Adjust_SV(t,r,pars0)
% Adjust_SV: Adjust the parameters for the Svensson model. 
%
% EXAMPLE:
%  t = [ 0; 1/12; 3/12; 6/12;   1;  3; 10];
%  r = [ 5;   4 ;  3.5;  4.5; 5.1;6.0; 6.2]; 
%  pars0 = [6.2 -1.2 -5 3/12 0.0  1 ];
%  [b0,b1,b2,tau1,b3,tau2] = Adjust_SV(t,r,pars0);
%  
%  nPlot = 1000; 
%  tPlot = linspace(t(1),t(end)*1.1,nPlot); 
%  rSVPlot = Svensson(tPlot,b0,b1,b2,tau1,b3,tau2);
%  figure(1); plot(t,r,'rx',tPlot,rSVPlot);
%
pars = fminunc(@MSE_SV,pars0,[],t,r);
b0 = pars(1); b1 = pars(2); b2 = pars(3);
tau1 = pars(4); b3 = pars(5); tau2 = pars(6);
end