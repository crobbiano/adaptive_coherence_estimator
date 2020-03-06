function [S] = ace_genCov(pings)
%ace_genCov generate the covariance matrix
%   Detailed explanation goes here


[numElements, numPings, numSamples] = size(pings);

data = zeros(numElements,numPings*numSamples);
% stack all the data
for i = 1:numPings
    data(:,(i-1)*numSamples + 1:(i-1)*numSamples + numSamples) =  squeeze(pings(:,i,:));
end

S=cov(data');

end

