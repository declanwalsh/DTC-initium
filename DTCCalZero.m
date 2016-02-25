% Function that calibrates scanners to zero only conditions
% Should be performed at atmospheric conditions
% Can be checked with the DTCSetupCoeff function that will print the affected calibration constants
% Author: Declan Walsh
% Last Modified: 24/02/2016

% Input Arguments:
%   t = Initium ethernet object
%   lrn = logical range number of scanners to cal zero

% Return Values: 
%   no values returned

function [ ] = DTCCalZero( t, LRN )

    TIME_CALZ = 25; % time in seconds for calibration to occur

    % default to zeroing all connected ports
    strMeasure = sprintf('CA2;')
    fwrite(t, strMeasure);
    
    pause(TIME_CALZ + 1); % clicks should be heard at beginning and end of calibration
    
    [out] = DTCCheckHeader(t); % check for confirmation packet
    
end

