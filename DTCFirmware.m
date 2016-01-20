% Function that prints the firmware of the Initium
% Author: Declan Walsh
% Last Modified: 15/01/2016

% Input Arguments:
%   t = Initium ethernet object
%   CRS = string of cluster rack slot numbers (normally 111)

% Return Values: NONE

function [  ] = DTCFirmware( t, CRS )

    strFirmware = sprintf('LA4 %s;', CRS)
    fwrite(t, strFirmware);
    
    firmware = DTCCheckHeader(t);

    fprintf('The firmware of the DTC Initium is: %f', firmware);
    
end

