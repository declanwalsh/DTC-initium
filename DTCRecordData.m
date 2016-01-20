% Function that collects data from Initium
% Returns the data as Matlab arrays
% Author: Declan Walsh
% Last Modified: 15/01/2016

% Input Arguments:
%   t = Initium ethernet object
%   n = number of data points expected
%   data = array to store data into

% Return Values:
%   retData = array passed into function now filled with measured data

function [ retData ] = DTCRecordData( t, n, data )

    NUM_ELEMENTS = 1; % number of elements to take off at once
    
    % logs each 4 byte EU value to the data array
    for (ii = 1:n)
        data(1, ii) = single(fread(t, 1, 'single'));
    end

    retData = data;
    
end

