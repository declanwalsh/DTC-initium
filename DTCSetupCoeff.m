% Function that prints the group 0 coefficients
% Author: Declan Walsh
% Last Modified: 24/02/2016

% Input Arguments:
%   t = Initium ethernet object
%   CRS = cluster, rack, slot (ESP ID)
%   STBL = integer of setup table (1-5 are possible)
%   SPORT = Scanner/port numbers to be included in response

% Return Values: 
%   coeffTable = group 0 adjustable DTC coefficients (set by calibration)

function [ coeffTable ] = DTCSetupCoeff( t, CRS, STBL, SPORT)

    strMeasure = sprintf('OP2 %s -%d %s;', CRS, STBL, SPORT);
    fwrite(t, strMeasure);
    
    [out] = DTCCheckHeader(t); % check header and get information about expected data (array response type)
    r = out(1); % rows
    c = out(2); % columns
    
    table = zeros(r, c);
    
    fprintf('Number of rows = %d and columns = %d\n', r, c);
    table = DTCRecordArray(t, r, c, table); % collect all array elements and store in Matlab matrix
    
    coeffTable = table;

end

