% Function that checks the error code given from the Initium
% Author: Declan Walsh
% Last Modified: 15/01/2016

% Input Arguments:
%   code = signed integer error code (should be negative)

% Return Values: NONE

function [ ] = DTCCheckError( code )

    fprintf(1, 'Error %d: ', code);

    switch code
        case -3
            fprintf(1, 'Illegal Command ID\n');
        case -5
            fprintf(1, 'Parameter is Missing\n');
        case -6
            fprintf(1, 'Value Too Low\n');
        case -7
            fprintf(1, 'Value Too High\n');
        case -10
            fprintf(1, 'Upper Val < Lower Val\n');
        case -11
            fprintf(1, 'Bad Name for Parameter\n');
        case -12
            fprintf(1, 'Need Integer Number\n');
        case -13
            fprintf(1, 'Need Float Point\n');
        case -14
            fprintf(1, 'Illegal CRS Number\n');
        case -18
            fprintf(1, 'Bad Sensor Port Number\n');
        case -19
            fprintf(1, 'Bad Upper Port Number\n');
        case -20
            fprintf(1, 'Upper Port Number < Lower Number\n');
        case -21
            fprintf(1, 'Bad Scanner Number\n');
        case -25
            fprintf(1, 'Bad Upper Scanner Number\n');
        case -27
            fprintf(1, 'Bad Logical Range\n');
        case -32
            fprintf(1, 'Too Many Parameters\n');
        case -39
            fprintf(1, 'Non-Vol. Mem Error\n');
        case -53
            fprintf(1, 'No Module This CRS\n');
        case -68
            fprintf(1, 'Port Not Defined in Scan Table\n');
        case -69
            fprintf(1, 'Port Not Defined\n');
        case -75
            fprintf(1, 'SDU Table Not Defined\n');
        case -80
            fprintf(1, 'DATA Not Acquired\n');
        case -82
            fprintf(1, 'Data Acquisition Aborted\n');
        case -230
            fprintf(1, 'Module Not Ready\n');
        otherwise
            fprintf(1, 'Unknown Error Code Received\n');
    end
            

end
