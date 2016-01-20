% Function that sets up a single 64 channel EPS on the DTC DAQ unit
% Author: Declan Walsh
% Last Modified: 14/01/2016

% Input Arguments:
%   t = Initium ethernet object

% Return Values: NONE

function [ ] = DTCSingleSetup( t )

    % setup settings
    CRS = '111';  % default CRS (111 - 118 are possible)
    NUM_CHANNELS = 64; % number of channels on the ESP
    SCN_ADDRESS = 1; % scanner address (1-8)
    LRN = 1; % logical range number
    STBL = 1; % scanner table used (1-4, 5 is Initium generated)
    SPORT = '101-164'; % 64 ports on first scanner
    
    % measurement settings
    NFR = 64; % number of frames averaged over for each measurement set
    FRD = 0; % frame delay (should be 0)
    NMS = 1; % number of pressure measurement sets to take (0 = continuous until aborted)
    MSD = 500; % milliseconds between start of sequential pressure measurement sets
    TRM = 'FREE'; % trigger mode - free ignores trigger
    SCM = 'PAM'; % scan mode - parrallel address mode scans ports concurrently
    OCF = 2; % output convert format (2 = normal EU pressure)
    UNX = 3; % units index (1 = psi, 3 = Pa, 6 = atm, 7 = mmHg, 8 = mmH20, 9 = bar, 10 = kPa, 11 = mbar) 
    
    % define connected scanners
    setupString = sprintf('SD1 %s (%d, %d, %d);', CRS, SCN_ADDRESS, NUM_CHANNELS, LRN)
    fprintf(t, setupString);
    DTCCheckHeader(t);
    
    % define data acquisition parameters
    daqString = sprintf('SD2 %s %d (%d %d) (%d %d) (%s %s) %d;', CRS, STBL, NFR, FRD, NMS,MSD, TRM, SCM, OCF)
    fprintf(t, daqString);
    DTCCheckHeader(t);

    % define scan list
    scanString = sprintf('SD3 %s %d, %s;', CRS, STBL, SPORT) 
    fprintf(t, scanString);
    DTCCheckHeader(t);
    
    % load and store DTC scanners EEPROM coefficients
    coeffString = sprintf('SD5 %s %d %d;', CRS, -1, 20) 
    fprintf(t, coeffString);
    DTCCheckHeader(t);
    
    % sets the engineering units
    engString = sprintf('PC4 %d %d;', LRN, UNX) 
    fprintf(t, engString);
    DTCCheckHeader(t);
    
end

