% Function that read the checks the response code in Initium messages
% Author: Declan Walsh
% Last Modified: 15/01/2016

% Input Arguments:
%   code = unsigned 8 bit integer response code

% Return Values: NONE


function [  ] = DTCCheckResponseCode( code )

    rangeSD = num2cell(10:19);
    rangePC = num2cell(30:39);
    rangeAD = num2cell(100:109);
    rangeCA = num2cell(120:129);
    rangeOP = num2cell(130:139);
    rangeCV = num2cell(140:149);
    rangeLA = num2cell(150:159);
    rangeCP = num2cell(160:169);
    rangeSC = num2cell(180:189);
    rangeDAmeas = 250;
    rangeDAcomp = 251;
    
    fprintf(1, 'Response Code %d: ', code)
    
    switch code
        case rangeSD
            fprintf(1, 'SDU Initialisation (SDx) Commands\n');
        case rangePC
            fprintf(1, 'Initialisation (PCx) Commands\n');
        case rangeAD
            fprintf(1, 'Data Acquisition (ADx) Commands\n');
        case rangeCA
            fprintf(1, 'Calibration (CAx) Commands\n');
        case rangeOP
            fprintf(1, 'Output Calibration Parameter (OPx) Commands\n');
        case rangeCV
            fprintf(1, 'Valve Control (CVx) Commands\n');
        case rangeLA
            fprintf(1, 'Look-At (LAx) Commands\n');
        case rangeCP
            fprintf(1, 'Set Calibration Parameters (CPx) Commands\n');
        case rangeSC
            fprintf(1, 'System Communication (CPx) Commands\n');
        case rangeDAmeas
            fprintf(1, 'Data Acquisition (DA) Stream Packet (measurement set)\n');
        case rangeDAcomp
            fprintf(1, 'Data Acquisition (DA) Stream Packet (comp-set)\n');
        otherwise
            fprintf(1, 'Unknown Response Code Received\n');
    end

end