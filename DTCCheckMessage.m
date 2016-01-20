% Function that checks the message in the header
% Converts the message to appropriate format based on message type
% Author: Declan Walsh
% Last Modified: 15/01/2016

% Input Arguments:
%   t = Initium ethernet object
%   msg = message in header (int32 at this point)
%   type = response type of header (already parsed - integer)

% Return Values:
%   msgConverted = msg input converted to appropriate class for message type

function [ msgConverted ] = DTCCheckMessage( msg, type, t )

    switch type
        case 4 % confirmation case
            tmp = int32(msg);
            DTCCheckResponseConfirmation(tmp);
            
        case 8 % single value as long
            tmp = uint32(msg);
            
        case 9 % single value as floating point
            tmp = single(msg);
            
        case num2cell([16, 17, 19]) % stream response - this is for measured data
            streamConvert = typecast(msg, 'uint16'); 
            % break 4 byte message into 2x 2 byte unsigned integers
            % measurement set sequence number and number of data values
            
            measSeq = streamConvert(1); 
            n = streamConvert(2);
            [CRS, IUtype, STBL, NFR, CNVT, SEQ] = DTCCheckStreamHeader(t); % streams have additional header information
            % NFR = number of scanned frames
            
            tmp = [measSeq, n, NFR]; % these are the only variables used (others can be used for additional checks if desired)
            
        case 33 % array data response
            dim = typecast(msg, 'uint16'); 
            % break 4 byte message into 2x 2 byte unsigned integers
            % rows and columns (dimensions) of array response
            
            r = dim(1);
            c = dim(2);
            
            tmp = [r, c];
            
        case 128 % error case
            tmp = int32(msg);
            DTCCheckError(tmp); % prints the appropriate error to the user
            
        otherwise % unknown message type number received - gives error
            error('Unknown type encountered - conversion not possible');
    end

    % stops the program from running further if error packet detected
    assert(type ~= 128, 'ERROR DETECTED - PROGRAM HALTED');
    
    % returns the converted message
    msgConverted = tmp;
    
end