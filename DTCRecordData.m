% Function that collects data from Initium stream
% Stores and returns the data as Matlab arrays
% Author: Declan Walsh
% Last Modified: 20/01/2016

% Input Arguments:
%   t = Initium ethernet object
%   n = number of data points expected
%   data = array to store data into
%   respType = response type as read from header

% Return Values:
%   retData = array passed into function now filled with measured data

function [ retData ] = DTCRecordData( t, n, data, respType )

    NUM_ELEMENTS = 1; % number of elements to take off at once
    
    % response type codes
    RESP_TYPE_EU = 19; 
    RESP_TYPE_2BYTE = 16;
    RESP_TYPE_3BYTE = 17;
    
    % determine the response type (which determine the size of each datum packet)
    % read the defined number of respone types from the stream
    if respType == RESP_TYPE_EU
        % logs each 4 byte EU value to the data array
        for (ii = 1:n)
            data(1, ii) = single(fread(t, 1, 'single'));
        end
    elseif respType == RESP_TYPE_2BYTE
        % logs each 2-byte number to array (as unsigned 16 bit integer)
        for (ii = 1:n)
            data(1, ii) = uint16(fread(t, 1, 'uint16'));
        end
    elseif respType ==  RESP_TYPE_3BYTE
        % logs each 3-byte number to array
        % hasn't been tested and may have problems
        % read each datum as 24 bit packet and output it in 32 bit integer format
        for (ii = 1:n)
            data(1, ii) = fread(t, 1, 'ubit24=>uint32');
        end
    else
        error(sprintf('Invalid response type for stream reading: %d', respType));
    end

    retData = data;
    
end

