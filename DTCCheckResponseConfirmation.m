% Function that checks a confirmation packet
% A confirmation message follows a confirmation reponse code
% The message should consist of all zeros
% Author: Declan Walsh
% Last Modified: 15/01/2016

% Input Arguments:
%   code = 32 bit integer message

% Return Values: NONE

function [  ] = DTCCheckResponseConfirmation( code )

    fprintf(1, 'Response is %d', code);

    if (code == 0)
        fprintf(1, ' Confirmation Packet OK\n');
    else
        fprintf(1, ' - WARNING - may indicate warning number\n');
    end

end