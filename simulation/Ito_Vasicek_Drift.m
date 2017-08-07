function a = Ito_Vasicek_Drift(r,t,alpha,r_inf,sigma)
% Ito_Vasicek_Drift: Drift component for the Vasicek model.
%
a = -alpha*(r-r_inf);
end