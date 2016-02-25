% very short example program to demonstrate high level of functionality for DTC library
% Author: Declan Walsh
% Last Modified: 26/02/2016

% i)    run DTCsetup script to setup environment
% ii)   run measurement function to measure all pressures

DTCsetup; % runs setup script to create calibrated, properly configured DTC object

pOut = DTCMeasure(DTC, STBL) % measures all 64 port pressures and returns average over 64 frames 
fprintf('\nMeasured...\n\n');
