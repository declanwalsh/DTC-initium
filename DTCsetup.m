% script that sets up the DTC system for use
% Author: Declan Walsh
% Last Modified: 26/02/2016

%% VARIABLES
intip = '192.168.129.63'; % DTC intium IP address (written on rear of Initium controller)
intp =  8400; % DTC initium port (default)

CRS = '111'; % 'physical address' of DTC  - cluster, rack, slot
STBL = 1; % table of coefficients used by DTC

%% CREATE DTC TCP/IP OBJECT
DTC = tcpip(intip,intp,'Timeout',0.5,'NetworkRole','client','InputBufferSize',10*2^20);

%% SETUP DTC
fopen(DTC); % open object for communication
fprintf('\nOpened...\n\n');

DTCClearBuffer(DTC); % clear the buffer of any data

DTCSingleSetup(DTC); % 
fprintf('\nSetup Complete...\n\n');

DTCCalZero( DTC, 0); % rezero DTC to ambient conditions (no flow)
fprintf('\nScanner zeroed...\n\n');
