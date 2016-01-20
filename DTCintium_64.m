% Short example program to using a single 64 channel ESP connected to the DTC Initium

%%
close all;
clear all;
delete(instrfindall);
clc;

%%
intip = '192.168.129.63'; % DTC intium IP address (written on rear of Initium controller)
intp =  8400; % DTC initium port (default)

%%
t = tcpip(intip,intp,'Timeout',0.5,'NetworkRole','client','InputBufferSize',10*2^20);

%%
fopen(t);
fprintf('\nOpened...\n\n');

%%
CRS = '111';
STBL = 1;

%%

DTCClearBuffer(t);

DTCSingleSetup(t);
fprintf('\nSetup Complete...\n\n');

DTCFirmware(t, CRS);
fprintf('\nFirmware printed...\n\n');

DTCScannerStatus(t, CRS, STBL);
fprintf('\nScanner status printed...\n\n');

pOut = DTCMeasure(t, STBL);
fprintf('\nMeasured...\n\n');

%%
fclose(t);
delete(t);