function [beta, theta] = ace_detect(pings, S, PG)
%ace_detect adaptice coherence estimation detector
%   takes in the pings to be converted, covariance matrix for whitening,
%   the signal projection matrix and signal subspace projection matrix
%   outputs the detection statistics, beta for the pings

[numElements, numPings, numSamples] = size(pings);

beta = zeros(numPings, numSamples);

for ping=1:numPings
    y = squeeze(pings(:,ping,:));
    z = (S^-0.5)*y;
    
    beta(ping,:)=diag(z'*PG*z)./diag(z'*z);
end
end

