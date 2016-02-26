% Function that clears the buffer
% Author: Declan Walsh
% Last Modified: 20/01/2016

% Input Arguments:
%   t = Initium ethernet object

% Return Values: NONE

function [ ] = DTCClearBuffer( t )

    % reads and discards any bytes stored in buffer until there are none left
    while(t.BytesAvailable > 0)
      fread(t, 1);
    end

    fprintf('\nBuffer Cleared...\n\n');
    
end

