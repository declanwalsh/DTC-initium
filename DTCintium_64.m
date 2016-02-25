% Short example program to using a single 64 channel ESP connected to the DTC Initium
% Tests most functions
% Author: Declan Walsh
% Last Modified: 26/02/2016

%%
close all;
clear all;
delete(instrfindall);
clc;

%%
intip = '192.168.129.63'; % DTC intium IP address (written on rear of Initium controller)
intp =  8400; % DTC initium port (default)

%%
DTC = tcpip(intip,intp,'Timeout',0.5,'NetworkRole','client','InputBufferSize',10*2^20);

%%
fopen(DTC);
fprintf('\nOpened...\n\n');

%%
CRS = '111';
STBL = 1;

%%

DTCClearBuffer(DTC);

%%

DTCSingleSetup(DTC);
fprintf('\nSetup Complete...\n\n');

DTCFirmware(DTC, CRS);
fprintf('\nFirmware printed...\n\n');

DTCScannerStatus(DTC, CRS, STBL);
fprintf('\nScanner status printed...\n\n');

%%

tableInitial = DTCSetupCoeff(DTC, CRS, STBL, '101-164' )
fprintf('\nInitial calibration constants printed...\n\n');

%%
DTCCalZero( DTC, 0);
fprintf('\nScanner zeroed...\n\n');

tableFinal = DTCSetupCoeff(DTC, CRS, STBL, '101-164')
fprintf('\nRevised calibration constants printed...\n\n');

%%

pOut = DTCMeasure(DTC, STBL)
fprintf('\nMeasured...\n\n');

%%
%fclose(t);
%delete(t);