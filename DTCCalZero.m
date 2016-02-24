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

    strMeasure = sprintf('CA2 %d;', LRN)
    fwrite(t, strMeasure);
    
    [out] = DTCCheckHeader(t); % check for confirmation packet

end

