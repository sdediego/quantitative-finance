function r = Svensson(t,b0,b1,b2,tau1,b3,tau2)
% Svensson: Svensson model for term structure of interests rates.
%
% SINTAXIS:  
%  r = Svensson(t,b0,b1,b2,tau1,b3,tau2)
%
%    t : Time
%  tau1 : Decay factor
%  tau2 : Decay factor
%    b0 : Long run levels of interest rates
%    b1 : Short-term component of interest rates
%    b2 : Medium-term component of interest rates
%    b3 : Medium-term component of interest rates
%
% EXAMPLE: 
%  tau1 = 0.5; tau2 = 0.2; b0 = 4; b1 = -2; b2 = -6; b3 = -3;
%  nPlot = 1000;  tPlot = linspace(0,3,nPlot);
%  rPlot = Svensson(tPlot,b0,b1,b2,tau1,b3,tau2);
%  figure(1); plot(tPlot, rPlot);
%  xlabel('t (years)'); ylabel('interest rate(%)')
%
t1 = t/tau1;
t2 = t/tau2;
r = b0 + b1*exp(-t1) + b2*t1.*exp(-t1) + b3*t2.*exp(-t2);
end
