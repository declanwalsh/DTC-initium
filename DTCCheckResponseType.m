% Function that checks the response type in Initium messages
% Author: Declan Walsh
% Last Modified: 15/01/2016

% Input Arguments:
%   code = 8 bit unsigned integer response type

% Return Values: NONE

function [ ] = DTCCheckResponseType( code )

    %fprintf(1, 'Response Type %d: ', code);

    switch code
        case 4
            %fprintf(1, 'Confirmation Packet\n');
        case 8
            %fprintf(1, 'Singe Value as Long Integer\n');
        case 9
            %fprintf(1, 'Single Value as IEEE Floating Point Number\n');
        case 16
            %fprintf(1, 'Stream Data with Raw 2-Byte Binary Numbers - CHANGE TO EU\n');
        case 17
            %fprintf(1, 'Stream Data with Raw 3-Byte Binary Numbers - CHANGE TO EU\n');
        case 19
            %fprintf(1, 'Stream Data with EU 4-byte IEEE Floating Point Numbers\n');
        case 33
            %fprintf(1, 'Array Data with 4-byte IEEE Floating Point Numbers\n');
        case 128
            %fprintf(1, 'Error Packet\n');
        otherwise
            %fprintf(1, 'Unknown Respones Type\n');
    end

end
