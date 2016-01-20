% Function that aborts the Initium current action
% Author: Declan Walsh
% Last Modified: 14/01/2016

% Input Arguments:
%   t = Initium ethernet object

% Return Values: NONE

function [] = DTCAbort( t )

    fwrite(t, 'AD0');
    
    DTCCheckHeader(t);   % confirmation from aborted command
    DTCCheckHeader(t);   % confirmation from AD0 command

end