function mat = quat2rotm(q)
  w = q(1);
  x = q(2);
  y = q(3);
  z = q(4);
  Nq = w*w + x*x + y*y + z*z;
  s = 2.0/Nq;
  X = x*s;
  Y = y*s;
  Z = z*s;
  wX = w*X; wY = w*Y; wZ = w*Z;
  xX = x*X; xY = x*Y; xZ = x*Z;
  yY = y*Y; yZ = y*Z; zZ = z*Z;
  mat = [[ 1.0-(yY+zZ), xY-wZ, xZ+wY ],
         [ xY+wZ, 1.0-(xX+zZ), yZ-wX ],
         [ xZ-wY, yZ+wX, 1.0-(xX+yY) ]];
