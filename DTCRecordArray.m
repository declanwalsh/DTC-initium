% Function that collects data from Initium array
% Stores and returns the data as Matlab arrays
% Author: Declan Walsh
% Last Modified: 20/01/2016

% Input Arguments:
%   t = Initium ethernet object
%   n = number of data points expected
%   data = array to store data into

% Return Values:
%   retData = array passed into function now filled with measured data

function [ retData ] = DTCRecordArray( t, r, c, data)

    % arrays from the Initium always are 4-byte floating point numbers

    for (ii = 1:c) % moves across columns
        for (jj = 1:r) % moves down rows
            % logs each 4 byte EU value to the data array
            data(jj, ii) = fread(t, 1, '*single');
        end
    end


    retData = data;
    
end

