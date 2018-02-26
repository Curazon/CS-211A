filename = 'data/DSCF4177.jpg';

points_3d = [
0, 0, 0;
64, 0, 0;
64, 64, 0;
%0, 64, 0; % blue bottom
0, 0, 19;
64, 0, 19;
64, 64, 19;
%0, 64, 19; % blue top
0, 0, 29;
64, 0, 29;
64, 64, 29;
%0, 64, 29; % red top
16, 16, 29;
48, 16, 29;
48, 48, 29;
%16, 48, 29; % center green bottom
16, 16, 48;
48, 16, 48;
48, 48, 48;
%16, 48, 48; % center green top 
%0, 48, 29;
%32, 48, 29;
%32, 80, 29;
%0, 80, 29; % corner green bottom
0, 48, 48;
32, 48, 48;
32, 80, 48;
%0, 80, 48; % yellow bottom
0, 48, 67;
32, 48, 67;
32, 80, 67;
%0, 80, 67; % yellow top
];

points_2d = [
227.50 1564.25;
733.00 1784.75;
1075.00 1345.25;
176.50 1445.75;
692.50 1663.25;
1052.50 1220.75;
148.00 1373.75;
682.00 1592.75;
1045.00 1153.25;
382.00 1312.25;
638.50 1409.75;
827.50 1198.25;
337.00 1172.75;
599.50 1268.75;
791.50 1061.75;
425.50 925.25;
667.00 1001.75;
845.50 830.75;
380.50 772.25;
632.50 850.25;
818.50 676.25;
];

C = solveCalibrationMatrix(points_3d, points_2d);

[~,name,~] = fileparts(filename);
out_filename = sprintf('out/calibration/%s.mat', name);  % e.g. out/calibration/DSCF4177.mat
save(out_filename, 'points_3d', 'points_2d', 'C');


%%


filename = 'data/DSCF4178.jpg';

points_3d = [
0, 0, 0;
64, 0, 0;
64, 64, 0;
%0, 64, 0; % blue bottom
0, 0, 19;
64, 0, 19;
64, 64, 19;
%0, 64, 19; % blue top
0, 0, 29;
64, 0, 29;
64, 64, 29;
%0, 64, 29; % red top
16, 16, 29;
48, 16, 29;
48, 48, 29;
%16, 48, 29; % center green bottom
16, 16, 48;
48, 16, 48;
48, 48, 48;
%16, 48, 48; % center green top 
%0, 48, 29;
%32, 48, 29;
%32, 80, 29;
%0, 80, 29; % corner green bottom
0, 48, 48;
32, 48, 48;
32, 80, 48;
%0, 80, 48; % yellow bottom
0, 48, 67;
32, 48, 67;
32, 80, 67;
%0, 80, 67; % yellow top
];

points_2d = [
265.00 893.75;
511.00 1163.75;
988.00 914.75;
227.50 779.75;
470.50 1028.75;
967.00 788.75;
203.50 703.25;
451.00 962.75;
953.50 718.25;
386.50 707.75;
512.50 824.75;
760.00 709.25;
347.50 565.25;
476.50 679.25;
728.50 568.25;
533.50 403.25;
659.50 493.25;
892.00 400.25;
500.50 257.75;
634.00 349.25;
869.50 257.75;
];

C = solveCalibrationMatrix(points_3d, points_2d);

[~,name,~] = fileparts(filename);
out_filename = sprintf('out/calibration/%s.mat', name);  % e.g. out/calibration/DSCF4177.mat
save(out_filename, 'points_3d', 'points_2d', 'C');

%%

filename = 'data/DSCF4179.jpg';

points_3d = [
0, 0, 0;
64, 0, 0;
64, 64, 0;
%0, 64, 0; % blue bottom
0, 0, 19;
64, 0, 19;
64, 64, 19;
%0, 64, 19; % blue top
0, 0, 29;
64, 0, 29;
64, 64, 29;
%0, 64, 29; % red top
%16, 16, 29;
%48, 16, 29;
%48, 48, 29;
%16, 48, 29; % center green bottom
16, 16, 48;
48, 16, 48;
48, 48, 48;
%16, 48, 48; % center green top 
%0, 48, 29;
%32, 48, 29;
%32, 80, 29;
%0, 80, 29; % corner green bottom
%0, 48, 48;
%32, 48, 48;
%32, 80, 48;
%0, 80, 48; % yellow bottom
0, 48, 67;
32, 48, 67;
32, 80, 67;
%0, 80, 67; % yellow top
];

points_2d = [
206.50 1264.25;
616.00 1441.25;
1060.00 1189.25;
176.50 1102.25;
595.00 1259.75;
1045.00 1025.75;
161.50 1010.75;
586.00 1163.75;
1042.00 946.25;
362.50 814.25;
572.50 878.75;
806.50 784.25;
485.50 529.25;
685.00 568.25;
898.00 505.25;
];

C = solveCalibrationMatrix(points_3d, points_2d);

[~,name,~] = fileparts(filename);
out_filename = sprintf('out/calibration/%s.mat', name);  % e.g. out/calibration/DSCF4177.mat
save(out_filename, 'points_3d', 'points_2d', 'C');

%%

filename = 'data/DSCF4180.jpg';

points_3d = [
0, 0, 0;
64, 0, 0;
%64, 64, 0;
%0, 64, 0; % blue bottom
0, 0, 19;
64, 0, 19;
%64, 64, 19;
%0, 64, 19; % blue top
0, 0, 29;
64, 0, 29;
64, 64, 29;
%0, 64, 29; % red top
16, 16, 29;
48, 16, 29;
%48, 48, 29;
%16, 48, 29; % center green bottom
16, 16, 48;
48, 16, 48;
48, 48, 48;
16, 48, 48; % center green top 
0, 48, 29;
%32, 48, 29;
%32, 80, 29;
%0, 80, 29; % corner green bottom
0, 48, 48;
32, 48, 48;
%32, 80, 48;
%0, 80, 48; % yellow bottom
0, 48, 67;
32, 48, 67;
32, 80, 67;
0, 80, 67; % yellow top
];

points_2d = [
740.50 2107.25;
1487.50 1879.25;
710.50 1934.75;
1490.50 1715.75;
695.50 1837.25;
1495.00 1619.75;
1225.00 1196.75;
856.00 1637.75;
1234.00 1541.75;
835.00 1451.75;
1223.50 1358.75;
1111.00 1154.75;
751.00 1228.25;
581.50 1442.75;
547.00 1255.25;
919.00 1172.75;
515.50 1055.75;
898.00 980.75;
818.50 817.25;
461.50 875.75;
];

C = solveCalibrationMatrix(points_3d, points_2d);

[~,name,~] = fileparts(filename);
out_filename = sprintf('out/calibration/%s.mat', name);  % e.g. out/calibration/DSCF4177.mat
save(out_filename, 'points_3d', 'points_2d', 'C');


%%

filename = 'data/DSCF4181.jpg';

points_3d = [
0, 0, 0;
64, 0, 0;
%64, 64, 0;
0, 64, 0; % blue bottom
0, 0, 19;
64, 0, 19;
%64, 64, 19;
0, 64, 19; % blue top
0, 0, 29;
64, 0, 29;
%64, 64, 29;
0, 64, 29; % red top
16, 16, 29;
48, 16, 29;
%48, 48, 29;
16, 48, 29; % center green bottom
16, 16, 48;
48, 16, 48;
48, 48, 48;
16, 48, 48; % center green top 
%0, 48, 29;
%32, 48, 29;
%32, 80, 29;
%0, 80, 29; % corner green bottom
%0, 48, 48;
%32, 48, 48;
%32, 80, 48;
%0, 80, 48; % yellow bottom
0, 48, 67;
32, 48, 67;
%32, 80, 67;
0, 80, 67; % yellow top
];

points_2d = [
1961.50 2044.25;
2149.00 1562.75;
1291.00 1840.25;
1967.50 1885.25;
2156.50 1432.25;
1277.50 1688.75;
1972.00 1799.75;
2167.00 1346.75;
1267.00 1604.75;
1847.50 1615.25;
1960.00 1402.25;
1507.00 1529.75;
1847.50 1442.75;
1957.00 1238.75;
1634.50 1171.25;
1502.50 1360.25;
1393.00 1279.25;
1546.00 1075.25;
1057.00 1199.75;
];

C = solveCalibrationMatrix(points_3d, points_2d);

[~,name,~] = fileparts(filename);
out_filename = sprintf('out/calibration/%s.mat', name);  % e.g. out/calibration/DSCF4177.mat
save(out_filename, 'points_3d', 'points_2d', 'C');

%%

filename = 'data/DSCF4182.jpg';

points_3d = [
0, 0, 0;
%64, 0, 0;
%64, 64, 0;
0, 64, 0; % blue bottom
0, 0, 19;
%64, 0, 19;
%64, 64, 19;
0, 64, 19; % blue top
0, 0, 29;
64, 0, 29;
%64, 64, 29;
0, 64, 29; % red top
16, 16, 29;
%48, 16, 29;
%48, 48, 29;
%16, 48, 29; % center green bottom
16, 16, 48;
48, 16, 48;
%48, 48, 48;
%16, 48, 48; % center green top 
0, 48, 29;
%32, 48, 29;
%32, 80, 29;
0, 80, 29; % corner green bottom
0, 48, 48;
%32, 48, 48;
32, 80, 48;
0, 80, 48; % yellow bottom
0, 48, 67;
32, 48, 67;
32, 80, 67;
0, 80, 67; % yellow top
];

points_2d = [
2654.50 1885.25;
1886.50 1903.25;
2704.00 1718.75;
1898.50 1741.25;
2726.50 1628.75;
2491.00 1153.25;
1907.50 1649.75;
2465.50 1489.25;
2503.00 1303.25;
2402.50 1084.25;
2107.00 1642.25;
1696.00 1648.25;
2134.00 1444.25;
1673.50 1225.25;
1703.50 1453.25;
2158.00 1235.75;
2080.00 997.25;
1681.00 1006.25;
1709.50 1244.75;
];

C = solveCalibrationMatrix(points_3d, points_2d);

[~,name,~] = fileparts(filename);
out_filename = sprintf('out/calibration/%s.mat', name);  % e.g. out/calibration/DSCF4177.mat
save(out_filename, 'points_3d', 'points_2d', 'C');

%%

filename = 'data/DSCF4183.jpg';

points_3d = [
0, 0, 0;
%64, 0, 0;
64, 64, 0;
0, 64, 0; % blue bottom
0, 0, 19;
%64, 0, 19;
64, 64, 19;
0, 64, 19; % blue top
0, 0, 29;
%64, 0, 29;
64, 64, 29;
0, 64, 29; % red top
16, 16, 29;
%48, 16, 29;
%48, 48, 29;
%16, 48, 29; % center green bottom
16, 16, 48;
%48, 16, 48;
%48, 48, 48;
%16, 48, 48; % center green top 
0, 48, 29;
%32, 48, 29;
32, 80, 29;
0, 80, 29; % corner green bottom
0, 48, 48;
%32, 48, 48;
32, 80, 48;
0, 80, 48; % yellow bottom
0, 48, 67;
%32, 48, 67;
32, 80, 67;
0, 80, 67; % yellow top
];

points_2d = [
2776.00 1211.75;
1880.50 1214.75;
2378.50 1447.25;
2792.50 1045.25;
1885.00 1049.75;
2393.50 1256.75;
2801.50 950.75;
1883.50 961.25;
2396.50 1160.75;
2566.00 950.75;
2579.50 769.25;
2507.50 1100.75;
1999.00 1105.25;
2276.50 1210.25;
2522.50 898.25;
2003.50 904.25;
2287.00 1000.25;
2537.50 686.75;
2003.50 694.25;
2297.50 776.75;
];

C = solveCalibrationMatrix(points_3d, points_2d);

[~,name,~] = fileparts(filename);
out_filename = sprintf('out/calibration/%s.mat', name);  % e.g. out/calibration/DSCF4177.mat
save(out_filename, 'points_3d', 'points_2d', 'C');

%%

filename = 'data/DSCF4184.jpg';

points_3d = [
0, 0, 0;
%64, 0, 0;
64, 64, 0;
0, 64, 0; % blue bottom
0, 0, 19;
%64, 0, 19;
64, 64, 19;
0, 64, 19; % blue top
0, 0, 29;
64, 0, 29;
64, 64, 29;
0, 64, 29; % red top
%16, 16, 29;
%48, 16, 29;
48, 48, 29;
%16, 48, 29; % center green bottom
%16, 16, 48;
48, 16, 48;
48, 48, 48;
%16, 48, 48; % center green top 
0, 48, 29;
%32, 48, 29;
32, 80, 29;
0, 80, 29; % corner green bottom
0, 48, 48;
%32, 48, 48;
32, 80, 48;
0, 80, 48; % yellow bottom
0, 48, 67;
32, 48, 67;
32, 80, 67;
0, 80, 67; % yellow top
];

points_2d = [
2738.50 830.75;
1976.50 1007.75;
2626.00 1126.25;
2756.50 679.25;
1979.50 832.25;
2650.00 937.25;
2765.50 589.25;
2177.50 518.75;
1982.50 749.75;
2663.50 844.25;
2189.50 695.75;
2294.50 403.25;
2203.00 512.75;
2702.50 758.75;
2263.00 863.75;
2633.50 919.25;
2720.50 581.75;
2278.00 659.75;
2659.00 707.75;
2747.50 361.25;
2386.00 328.25;
2293.00 445.25;
2686.00 481.25;
];

C = solveCalibrationMatrix(points_3d, points_2d);

[~,name,~] = fileparts(filename);
out_filename = sprintf('out/calibration/%s.mat', name);  % e.g. out/calibration/DSCF4177.mat
save(out_filename, 'points_3d', 'points_2d', 'C');

%%

filename = 'data/DSCF4186.jpg';

points_3d = [
%0, 0, 0;
%64, 0, 0;
%64, 64, 0;
0, 64, 0; % blue bottom
%0, 0, 19;
%64, 0, 19;
%64, 64, 19;
0, 64, 19; % blue top
%0, 0, 29;
%64, 0, 29;
%64, 64, 29;
%0, 64, 29; % red top
%16, 16, 29;
%48, 16, 29;
%48, 48, 29;
%16, 48, 29; % center green bottom
%16, 16, 48;
48, 16, 48;
48, 48, 48;
%16, 48, 48; % center green top 
%0, 48, 29;
32, 48, 29;
32, 80, 29;
0, 80, 29; % corner green bottom
%0, 48, 48;
32, 48, 48;
32, 80, 48;
0, 80, 48; % yellow bottom
%0, 48, 67;
32, 48, 67;
32, 80, 67;
0, 80, 67; % yellow top
];

points_2d = [
2638.00 1105.25;
2647.00 926.75;
2072.50 595.25;
2138.50 640.25;
2293.00 812.75;
2395.00 889.25;
2722.00 866.75;
2300.50 631.25;
2405.50 683.75;
2731.00 664.25;
2303.50 439.25;
2404.00 478.25;
2746.00 454.25;
];

C = solveCalibrationMatrix(points_3d, points_2d);

[~,name,~] = fileparts(filename);
out_filename = sprintf('out/calibration/%s.mat', name);  % e.g. out/calibration/DSCF4177.mat
save(out_filename, 'points_3d', 'points_2d', 'C');

%%


filename = 'data/DSCF4187.jpg';

points_3d = [
%0, 0, 0;
%64, 0, 0;
%64, 64, 0;
%0, 64, 0; % blue bottom
%0, 0, 19;
%64, 0, 19;
%64, 64, 19;
%0, 64, 19; % blue top
%0, 0, 29;
%64, 0, 29;
%64, 64, 29;
%0, 64, 29; % red top
%16, 16, 29;
48, 16, 29;
%48, 48, 29;
%16, 48, 29; % center green bottom
%16, 16, 48;
48, 16, 48;
48, 48, 48;
%16, 48, 48; % center green top 
%0, 48, 29;
%32, 48, 29;
%32, 80, 29;
0, 80, 29; % corner green bottom
%0, 48, 48;
32, 48, 48;
32, 80, 48;
0, 80, 48; % yellow bottom
%0, 48, 67;
32, 48, 67;
32, 80, 67;
0, 80, 67; % yellow top
];

points_2d = [
1610.50 514.25;
1607.50 355.25;
1751.50 416.75;
2300.50 592.25;
1889.50 391.25;
2072.50 458.75;
2315.50 407.75;
1897.00 212.75;
2083.00 269.75;
2335.00 224.75;
];

C = solveCalibrationMatrix(points_3d, points_2d);

[~,name,~] = fileparts(filename);
out_filename = sprintf('out/calibration/%s.mat', name);  % e.g. out/calibration/DSCF4177.mat
save(out_filename, 'points_3d', 'points_2d', 'C');

%%


filename = 'data/DSCF4188.jpg';

points_3d = [
%0, 0, 0;
64, 0, 0;
64, 64, 0;
%0, 64, 0; % blue bottom
%0, 0, 19;
64, 0, 19;
%64, 64, 19;
%0, 64, 19; % blue top
%0, 0, 29;
64, 0, 29;
%64, 64, 29;
%0, 64, 29; % red top
%16, 16, 29;
48, 16, 29;
%48, 48, 29;
%16, 48, 29; % center green bottom
%16, 16, 48;
48, 16, 48;
%48, 48, 48;
%16, 48, 48; % center green top 
%0, 48, 29;
%32, 48, 29;
%32, 80, 29;
0, 80, 29; % corner green bottom
%0, 48, 48;
32, 48, 48;
32, 80, 48;
0, 80, 48; % yellow bottom
%0, 48, 67;
32, 48, 67;
32, 80, 67;
0, 80, 67; % yellow top
];

points_2d = [
1153.00 808.25;
1595.50 956.75;
1139.50 659.75;
1135.00 581.75;
1333.00 554.75;
1325.50 395.75;
2032.00 532.25;
1643.50 401.75;
1894.00 457.25;
2039.50 370.25;
1648.00 230.75;
1903.00 274.25;
2053.00 199.25;
];

C = solveCalibrationMatrix(points_3d, points_2d);

[~,name,~] = fileparts(filename);
out_filename = sprintf('out/calibration/%s.mat', name);  % e.g. out/calibration/DSCF4177.mat
save(out_filename, 'points_3d', 'points_2d', 'C');

%%


filename = 'data/DSCF4185.jpg';

###

C = solveCalibrationMatrix(points_3d, points_2d);

[~,name,~] = fileparts(filename);
out_filename = sprintf('out/calibration/%s.mat', name);  % e.g. out/calibration/DSCF4177.mat
save(out_filename, 'points_3d', 'points_2d', 'C');

%%


filename = 'data/DSCF4185.jpg';

###

C = solveCalibrationMatrix(points_3d, points_2d);

[~,name,~] = fileparts(filename);
out_filename = sprintf('out/calibration/%s.mat', name);  % e.g. out/calibration/DSCF4177.mat
save(out_filename, 'points_3d', 'points_2d', 'C');

%%


filename = 'data/DSCF4185.jpg';

###

C = solveCalibrationMatrix(points_3d, points_2d);

[~,name,~] = fileparts(filename);
out_filename = sprintf('out/calibration/%s.mat', name);  % e.g. out/calibration/DSCF4177.mat
save(out_filename, 'points_3d', 'points_2d', 'C');

%%


filename = 'data/DSCF4185.jpg';

###

C = solveCalibrationMatrix(points_3d, points_2d);

[~,name,~] = fileparts(filename);
out_filename = sprintf('out/calibration/%s.mat', name);  % e.g. out/calibration/DSCF4177.mat
save(out_filename, 'points_3d', 'points_2d', 'C');

%%

