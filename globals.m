function opt = globals()

opt.root = '/sequoia/data2/ylabbe/datasets/pose-benchmarks/YCB_Video_Dataset';
opt.num_classes = 21;

opt.seq_num = 92;
opt.nums = [762, 1112, 1719, 2299, 2172, 1506, 1626, 2018, 2991, 1591, 1898, ...
    1107, 1104, 1800, 1619, 2305, 1335, 1716, 1424, 2218, 1873, 731, 1153, 1618, ...
    1401, 1444, 1607, 1448, 1558, 1164, 1124, 1952, 1254, 1567, 1554, 1668, ...
    2512, 2157, 3467, 3160, 2393, 2450, 2122, 2591, 2542, 2509, 2033, 2089, ...
    2244, 2402, 1917, 2009, 900, 837, 1929, 1830, 1226, 1872, 1720, 1864, ...
    754, 533, 680, 667, 668, 653, 801, 849, 884, 784, 1016, 951, 890, 719, 908, ...
    694, 864, 779, 689, 789, 788, 985, 743, 953, 986, 890, 897, 948, 453, 868, 842, 890] - 1;

opt.width = 640;
opt.height = 480;

opt.intrinsic_matrix_color = [1066.778, 0, 312.9869; 0, 1067.487 241.3109; 0, 0 ,1];
opt.intrinsic_matrix_depth = [567.6188, 0, 310.0724; 0, 568.1618 242.7912; 0, 0 ,1];

opt.depth2color = [ 0.9997563, 0.02131301, -0.005761033, 0.02627148; ...
                    -0.02132165, 0.9997716, -0.001442874, -0.0001685539; ...
                    0.005728965, 0.001565357, 0.9999824, 0.0002760285  ];

opt.intrinsic_matrix_color_cmu = [1077.836, 0, 323.7872; 0, 1078.189 279.6921; 0, 0 ,1];
opt.intrinsic_matrix_depth_cmu = [576.3624, 0, 319.2682; 0, 576.7067 243.8256; 0, 0 ,1];
 
opt.depth2color_cmu = [ 0.9999962, -0.002468782, 0.001219765, 0.02640966; ...
   0.002466791, 0.9999956, 0.001631345, -9.9086e-05; ...
   -0.001223787, -0.00162833, 0.9999979, 0.0002972445];

opt.class_colors = uint8([255, 255, 255; 255, 0, 0; 0, 255, 0; 0, 0, 255; 255, 255, 0; 255, 0, 255; 0, 255, 255;
                      128, 0, 0; 0, 128, 0; 0, 0, 128; 128, 128, 0; 128, 0, 128; 0, 128, 128;
                      64, 0, 0; 0, 64, 0; 0, 0, 64; 64, 64, 0; 64, 0, 64; 0, 64, 64; 
                      192, 0, 0; 0, 192, 0; 0, 0, 192]);

function mat = quat2rotm()
w = q(1)
x = q(2)
y = q(3)
z = q(4)
Nq = w*w + x*x + y*y + z*z
s = 2.0/Nq
X = x*s
Y = y*s
Z = z*s
wX = w*X; wY = w*Y; wZ = w*Z
xX = x*X; xY = x*Y; xZ = x*Z
yY = y*Y; yZ = y*Z; zZ = z*Z
mat = [[ 1.0-(yY+zZ), xY-wZ, xZ+wY ],
       [ xY+wZ, 1.0-(xX+zZ), yZ-wX ],
       [ xZ-wY, yZ+wX, 1.0-(xX+yY) ]]
