function  regiongsplit()
clear all;
I=double(imread('liftingbody.png'));
figure(1), imshow(uint8(I));
[M,N,K]=size(I);
Th=47;  Dim=2;            % Set ukuran region Dim dan Th
[Im,S]=imsplit(I,Dim,Th);      % Pembagian region
figure(2), imshow(uint8(Im));    % Tampilkan citra hasil
                                                         % Fungsi region splitting
function [I,S] = imsplit(I, Dim, Th)
L=1; i=0;
px=1; py=1; S=[];     % Inisial. posisi area dan List-proses
[M,N,K]=size(I);
if Dim>= min(M,N)            % Maksimum ukuran region
    Dim = min(M,N)/2;
end
while  L>=i                     % Kondisi pembacaan List-proses
  P=0;
  if (M>Dim && N>Dim)          % Kondisi ukuran region
      Im=I(py:py+M-1,px:px+N-1);
      [M1,N1,K]=size(Im);
      Dimy=floor(M1/2); Dimx=floor(N1/2);
                                             % Jika tidak homogen bagi region
      if (max(max(Im))-min(min(Im)))>Th
        P=[py px Dimy Dimx; py Dimx+px Dimy ... 
            N-Dimx; Dimy+py px M-Dimy Dimx; ...
            Dimy+py Dimx+px M-Dimy N-Dimx];
      end
  end

if P(1,1)>0        % Jika region terbagi catat dalam List-proses
      if i==0
          S=[S; P];
          i=i+1
      else
          S=[S(1:i-1,:); P; S(i+1:end,:)];
      end
  else
         i=i+1;
  end
  if i<=L              % Jika List-proses belum selesai diperiksa
     M=S(i,3);       % Periksa region ke-i dalam List-proses
     N=S(i,4);
     px=S(i,2); 
     py=S(i,1);
  end
  L=length(S);
end     % Kemb. ke while  hingga List-proses selesai diperiksa
                   % Petakan region yang terbentuk ke citra asli
m=S(:,1); n=S(:,2);
Vy=S(:,3); Vx=S(:,4);
L=length(m);
for i=1:L     % Beri warna putih (255) pada batas antar region
    I(m(i):m(i)+Vy(i)-1,n(i),:)=255;
    I(m(i),n(i):n(i)+Vx(i)-1,:)=255;
end
I(end,:,:)=255;
I(:,end,:)=255;
