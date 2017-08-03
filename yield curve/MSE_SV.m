function MSE = MSE_SV(parameters,t,r)
% MSE_SV: Mean Squared Error for the Svensson model.
%
parameters = num2cell(parameters);
MSE = mean((Svensson(t, parameters{:})-r).^2);
end