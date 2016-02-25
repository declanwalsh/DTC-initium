STATIC_PORT = 64;
TOTAL_PORT = 1;
DENSITY_AIR = 1.225;

pOut = DTCMeasure(t, STBL);

dynamicPDTC = pOut(TOTAL_PORT) - pOut(STATIC_PORT);
velDTC = sqrt(2*dynamicPDTC/DENSITY_AIR);

fprintf(1, 'The DTC tunnel velocity is %.2f m/s\n', velDTC);