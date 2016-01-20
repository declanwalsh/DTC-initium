% Function that measures pressures from an Intium setup table
% Author: Declan Walsh
% Last Modified: 20/01/2016

% Input Arguments:
%   t = Initium ethernet object
%   STBL = integer of setup table (1-5 are possible)

% Return Values:
%   finalP = array of read, processed and converted pressure measurements


function [ finalP ] = DTCMeasure( t, STBL )

    % size of measurement pause in seconds
    DELAY_MEAS = 10;

    strMeasure = sprintf('AD2 %d;', STBL)
    fwrite(t, strMeasure);
    
    pause(DELAY_MEAS); % pause to allow measurements to finish
    
    [out] = DTCCheckHeader(t); % check header and get information about expected data (stream response type)
    measSeq = out(1); % measSeq = measurement set sequence
    n = out(2); % n = number of data values
    NFR = out(3); % NFR = number of scanned frames (need to divide the total signal by for average)
    respType = out(4); % respType = rsponse type from header (to determine what format the stream data will be in)
    
    % array to hold pressure measurements
    p = zeros(1, n*measSeq);
    
    fprintf('Number of Data Values = %d\nMeasurement sequence = %d\nNumber of scanned frames = %d\n', n, measSeq, NFR);
    p = DTCRecordData(t, n*measSeq, p, respType);   
    % if data acquisition rate is higher than ethernet link rate Initium buffer may run out of memory
    % this is indicated by gaps in measurement set sequence numbers
    
    DTCCheckHeader(t); % should receive a confirmation/error packet at the end
    
    finalP = p;
    

end