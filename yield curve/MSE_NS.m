function MSE = MSE_NS(parameters,t,r)
% MSE_NS: Mean Squared Error for the Nelson-Siegel model.
%
parameters = num2cell(parameters); 
MSE = mean((r - Nelson_Siegel(t, parameters{:})).^2);
end