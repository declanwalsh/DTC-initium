% Function that looks at scanner status
% scanner status returned in 8 bit binary number (only 3 bits are used)
% each of these bit contains information about the scanner\
% Author: Declan Walsh
% Last Modified: 18/01/2016

% Input Arguments:
%   t = Initium ethernet object
%   CRS = string of cluster rack slot numbers (normally 111)
%   SCN = integer scanner number (default is 1)

% Return Values: NONE

function [  ] = DTCScannerStatus( t, CRS, SCN )

    % location of bits containing information in the binary number
    SENSITIVITY_BIT = 8;
    VALVE_BIT = 2;
    SCANNER_BIT = 1;

    % write LA1 command to Initium
    strStatus = sprintf('LA1 %s -%d97', CRS, SCN)
    fwrite(t, strStatus);

    % read header returned and convert to a binary number
    status = checkHeader(t);
    statusBin = dec2bin(status);

    % check the scanner bit
    if(statusBin(SCANNER_BIT) == 0)
        fprintf('Scanner Type: 0 = No DTC Scanner Attached');
    else
        fprintf('Scanner Type: 1 = DTC Scanner Attached');
    end

    % check the valve position bit
    if(statusBin(VALVE_BIT) == 0)
        fprintf('Valve Position: 0 = CAL Position');
    else
        fprintf('Valve Position: 1 = RUN Position');
    end

    % check the sensitivity bit
    if(statusBIN(SENSITIVITY_BIT) == 0)
        fprintf('Sensitive Range: 0 = Normal');
    else
        fprintf('Sensitive Range: 1 = Sensitive Range');
    end

end

