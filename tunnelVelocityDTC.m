% short script that uses an already setup DTC object to measure the tunnel velocity
% Author: Declan Walsh
% Last Modified: 26/02/2016

STATIC_PORT = 64; % port number the static pressure is connected to
TOTAL_PORT = 1; % port number the total pressure is connected to
DENSITY_AIR = 1.225; % density of air

pOut = DTCMeasure(DTC, STBL); % measure the pressures on all ESP ports

dynamicPDTC = pOut(TOTAL_PORT) - pOut(STATIC_PORT); % calculate the dynamic pressure
velDTC = sqrt(2*dynamicPDTC/DENSITY_AIR); % calculate the velocity from dynamic pressure

% print the resultant velocity to the user
fprintf(1, 'The DTC tunnel velocity is %.2f m/s\n', velDTC);