% Function that reads the additional information in the stream header
% returns various parameters that are present in the header

% Author: Declan Walsh
% Last Modified: 15/01/2016

% Input Arguments:
%   t = Initium ethernet object

% Return Values:
%   CRS = cluster, rack, server (string)
%   IUtype = input unit type 
%   STBL = setup table whose scan list was used for set
%   NFR = number of scanned frames (need to divide the total signal by for average)
%   CNVT = conversion type field (0 = none, 8 = EU)
%   SEQ = sequence number of set in DA run (0 = only, 1 = first, 2 = middle, 3 = last)

function [ CRS, IUtype, STBL, NFR, CNVT, SEQ ] = DTCCheckStreamHeader( t )

    % size of each parameter (number of elements) passed over connection
    SIZE_CLUSTER = 1;
    SIZE_RACK = 1;
    SIZE_SLOT = 1;
    SIZE_IUTYPE = 1;
    SIZE_STBL = 1;
    SIZE_NFR = 1;
    SIZE_TIME = 8; 
    SIZE_CNVT = 1;
    SIZE_SEQ = 1;
    
    C = uint8(fread(t, SIZE_CLUSTER));
    R = uint8(fread(t, SIZE_RACK));
    S = uint8(fread(t, SIZE_SLOT));
    % construct string of CRS for easy comparision
    CRS = sprintf('%d%d%d', C, R, S);
    
    IUtype = uint8(fread(t, SIZE_IUTYPE));
    STBL = uint8(fread(t, SIZE_STBL));
    NFR = uint8(fread(t, SIZE_NFR));
    
    fread(t, SIZE_TIME); % time bytes are currently unused
    
    CNVT = uint8(fread(t, SIZE_CNVT));
    SEQ = uint8(fread(t, SIZE_SEQ));
    
end

