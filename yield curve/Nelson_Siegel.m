function  r = Nelson_Siegel(t,b0,b1,b2,tau)
% Nelson_Siegel: Nelson-Siegel model for term structure of interests rates.
%
% SINTAXIS:  
%  r = Nelson_Siegel(t,b0,b1,b2,tau)
%
% EXAMPLE: 
%  tau = 0.5; b0 = 4; b1 = -2; b2 = -6;
%  nPlot = 1000;  tPlot = linspace(0,3,nPlot);
%  rPlot = Nelson_Siegel(tPlot,b0,b1,b2,tau);
%  figure(1); plot(tPlot, rPlot);
%  xlabel('t (years)'); ylabel('interest rate(%)')
%  
r = b0 + b1*exp(-t/tau) + b2*(t/tau).*exp(-t/tau);