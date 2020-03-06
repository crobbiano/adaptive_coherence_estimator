function [PG] = ace_genSigProj(theta,S)
%ace_genSigProj generates the signal projection matrix
%   takes in the angle in radians and covariance matrix
%   makes some asumptions about things

numElements = size(S,1);
u = [ones(numElements, 1) + 1i*ones(numElements, 1)];

n = [0:numElements - 1]';
sig = u.*exp(1i*pi*sin(theta)*n);

G = (S^-0.5)*sig;
for i=1:size(G,2)
    PG(:,:,i) = G(:,i)*inv(G(:,i)'*G(:,i))*G(:,i)';
end

end

