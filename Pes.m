%%plot(Dsen,'.');
%%histogram(Tsen);

x = [2 3 4 5 6 7 8 9];
p1t = [0.2081 0.1573 0.1132 0.0747 0.0462 0.0245 0.0124 0.0049];
p1e = [0.2109 0.1696 0.1191 0.0685 0.0481 0.0219 0.0124 0.0047];

p2t = [0.0907 0.0649 0.0426 0.0252 0.0132 0.0061 1.34e-3 7.125e-4];
p2e = [0.2015 0.1373 0.0911 0.0561 0.0334 0.0165 0.0068  0.0025];

figure()
plot(x,p1t,x,p1e,x,p2t,x,p2e);
legend('Constelacion I teo','Constelacion I exp','Constelacion II teo','Constelacion II exp');