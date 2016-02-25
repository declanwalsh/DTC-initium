% Function that checks the header of all Initium messages
% returns the appropriate parameter (conf, error, single value or size of array/stream)
% Author: Declan Walsh
% Last Modified: 18/01/2016

% Header is 8 bytes long
% Byte 1 is response code (reason why message was sent)
% Byte 2 is response type
% Bytes 3,4 are message length
% Bytes 5-8 are 
%   signed long integer for confirmation (0) or warning (positive)
%   signed long integer for error code (negative)
%   signed value response of long integer or floating point number
%   array data response (first 2 bytes are rows and second 2 bytes are columns)

% Input Arguments:
%   t = Initium ethernet object

% Return Values:
%   status = message in header (can be of several different formats)

function [ status ] = DTCCheckHeader( t )

    NUM_ELEMENTS = 1; % number of elements expected by fread
    SIZE_RESP_CODE = 1; % size of response code in bytes
    SIZE_RESP_TYPE = 1; % size of response type in bytes
    SIZE_MSG_LENGTH = 2; % size of message length in bytes
    SIZE_MSG = 4; % size of additional info in bytes
    
    HEADER_SIZE = SIZE_RESP_CODE + SIZE_RESP_TYPE + SIZE_MSG_LENGTH + SIZE_MSG;
    DELAY = 0.1; % delay to allow response
    
    pause(DELAY);
    fprintf(1,  'Bytes Available: %d\n', t.BytesAvailable);
    assert(t.BytesAvailable>= HEADER_SIZE, 'Not enough bytes waiting - header of packet not correctly sent');
    
    % collects the header bytes and stores them in variables of specified type
    statRespCode = uint8(fread(t, NUM_ELEMENTS, 'uint8'));
    statRespType = uint8(fread(t, NUM_ELEMENTS, 'uint8'));
    statMsgLength = uint16(fread(t, NUM_ELEMENTS, 'uint16'));
    statMsg = int32(fread(t, NUM_ELEMENTS, 'int32'));
    
    DTCCheckResponseCode(statRespCode); % checks the response code
    DTCCheckResponseType(statRespType); % checks the response type
    fprintf(1, 'Message Field Length:  %d\n', statMsgLength); % prints the total packet length (bytes)
    
    status = DTCCheckMessage(statMsg, statRespType, t); % converts the message into the proper type

end

