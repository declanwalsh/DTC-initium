% Function that measures pressures from an Intium setup table
% Author: Declan Walsh
% Last Modified: 20/01/2016

% Input Arguments:
%   t = Initium ethernet object
%   STBL = integer of setup table (1-5 are possible) -> 1 = filtered over 64 frames and 2 = single frame

% Return Values:
%   finalP = array of read, processed and converted pressure measurements


function [ finalP ] = DTCMeasure( t, STBL)

    NUM_CHANNELS = 64; % number of channels used (size of matrix of P)
    SHORT_DELAY = 0.01; % size of measurement pause in seconds
    
    % set the maximum number of frames to receive
    if (STBL == 1)
        maxSeq = 1; % number of measurements taken
    elseif (STBL == 2)
        maxSeq = 100;
    else
        fprintf(1, 'Unknown STBL - maxSeq set to 1 - may cause overflow errors')
        maxSeq = 1;
    end
    
    % array to hold pressure measurements
    p = zeros(maxSeq, NUM_CHANNELS);

    % write command to DTC Initium
    strMeasure = sprintf('AD2 %d;', STBL);
    fwrite(t, strMeasure)
     
    for jj = 1:maxSeq
      
      while(t.BytesAvailable == 0)
        pause(SHORT_DELAY); % pause to allow measurements to finish
      end
      
      [out] = DTCCheckHeader(t); % check header and get information about expected data (stream response type)
      n = out(1); % n = number of data values (should always be 64)
      measSeq = out(2); % measSeq = measurement set sequence
      NFR = out(3); % NFR = number of scanned frames (need to divide the total signal by for average)
      respType = out(4); % respType = response type from header (to determine what format the stream data will be in)
      
      % if data acquisition rate is higher than ethernet link rate Initium buffer may run out of memory
      % this is indicated by gaps in measurement set sequence numbers
      % fprintf(1, 'Number of Data Values = %d\nMeasurement sequence = %d\nNumber of scanned frames = %d\n\n', n, measSeq, NFR);
      
      p = DTCRecordData(t, n, p, respType, jj);
    
    end
   
    DTCCheckHeader(t); % should receive a confirmation/error packet at the end

    finalP = p;
    

end