%% Run ace - ace_run.m
clear all
clc
close all
addpath('..\util_scripts');
%% read in the data.
% expecting the format: data(elements, pings (slow time), fast time)
datapath = './ex_data.mat';
load(datapath);
%% Get info
[numElements, numPings, numSamples] = size(pings_data);

numSections = 200;
samplesPerSection = floor(numSamples/numSections);
%% Generate the covariance matrix
S=zeros(numElements,numElements,numSections);
for sec=1:numSections
    S(:,:, sec) = ace_genCov(pings_noise(:,:,(sec-1)*samplesPerSection + 1:(sec-1)*samplesPerSection + samplesPerSection));
end

%% Run the ace detector
theta = 0;

PG=zeros(numElements,numElements,numSections);
for sec=1:numSections
    PG = ace_genSigProj(theta, S(:,:,sec));
    beta(:,(sec-1)*samplesPerSection + 1:(sec-1)*samplesPerSection + samplesPerSection) = ace_detect(pings_data(:,:,(sec-1)*samplesPerSection + 1:(sec-1)*samplesPerSection + samplesPerSection), ...
        S(:,:, sec), ...
        PG);
end
beta = real(beta);
%% plot
threshold = .4;
threshed = beta; 
threshed(threshed < threshold) = 0;
threshed(threshed >= threshold) = 1;

figure(1);clf
imagesc(20*log10(abs(squeeze(pings_data(1,:,:)))))
title('Signal magnitude in dB')
ylabel('Ping number')
xlabel('Sample number')
colormap((gray))
colorbar

figure(2);clf
imagesc(beta)
title('ACE statistics')
ylabel('Ping number')
xlabel('Sample number')

figure(3);clf
imagesc(threshed)
title('Thresholded ACE statistics')
ylabel('Ping number')
xlabel('Sample number')