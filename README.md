# adaptive_coherence_estimator
Matlab implementation of the Adaptive Coherence Estimator for use in sensor array processing.  This code is based on the following references:

1. Scharf, Louis L and McWhorter, L Tood, "*Adaptive matched subspace detectors and adaptive coherence estimators*", Conf. Rec. 13th Asilomar Conf. on Signals, Systems and Computers
1. Kraut, Shawn and Scharf, Louis L and McWhorter, L Todd, "*Adaptive subspace detectors*", IEEE Trans. Signal Process

**Note:** This implementation uses a 1-dimensional signal subspace that is simply the electric steering of the sensor array.  A more sophisticated signal model can be used, but the signal subspace model in ace_genSigProj must be updated.

## Data format
These scripts expect the follow data structures:
* pings_data : 3d matrix indexed as pings_data(elements, pings (slow time), sample number (fast time)). Contains data to be processed by ACE.
* pings_noise : 3d matrix indexed as pings_data(elements, pings (slow time), sample number (fast time)). Contains data to be used in generation of the noise covariance matrices.

## Running the example
The file 'ace_test.m' is an example script for generating the noise covariance matrices, calculating the ACE statistics and thresholded versions, and plotting everything.
