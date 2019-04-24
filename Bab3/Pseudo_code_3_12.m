function [L,a,b] = rgb2LabImage(R,G,B)
if nargin == 1              
  B = double(R(:,:,3));   G = double(R(:,:,2));  R = double(R(:,:,1));
end
if max(max(R)) > 1.0 || max(max(G)) > 1.0 || max(max(B)) > 1.0
  R = double(R) / 255; G = double(G) / 255; B = double(B) / 255;
end
Th = 0.008856;  [M, N] = size(R);   s = M * N;
RGB = [reshape(R,1,s); reshape(G,1,s); reshape(B,1,s)];
                                           % citra RGB ke ruang XYZ
MAT = [0.412453 0.357580 0.180423;
       0.212671 0.715160 0.072169;
       0.019334 0.119193 0.950227];
XYZ = MAT * RGB;                           % konversi dari RGB ke XYZ
X = XYZ(1,:) / 0.950456;                   % normalisasi cahaya putih 
Y = XYZ(2,:);                              % untuk referensi D65
Z = XYZ(3,:) / 1.088754;
TX = X > Th;  TY = Y > Th;  TZ = Z > Th;   % set kondisi if                                               
fTX = TX .* X.^(1/3) + (~TX) .* (7.787 .* X + 16/116);
fTY = TY .* Y.^(1/3) + (~TY) .* (7.787 .* Y + 16/116);
fTZ = TZ .* Z.^(1/3) + (~TZ) .* (7.787 .* Z + 16/116);
L = reshape(116 * fTY - 16.0, M, N);                       % hitung luminance L
a = reshape(500 * (fTX - fTY), M, N);                      % hitung choram a*
b = reshape(200 * (fTY - fTZ), M, N);                      % hitung choram b*
if nargout < 2
  L = cat(3,L,a,b);
end
