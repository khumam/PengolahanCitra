function  RegiongSplitMerge()
clear all;
I=double(imread('liftingbody.png'));
figure(1), imshow(uint8(I));
[M,N,K]=size(I);
Th=47;  Dim=2;                    % Set ukuran region Dim dan Th
[Im,S]= imsplitmerge1(I,Dim,Th);  % Split & merge
figure(2), imshow(uint8(Im));     % Tampil citra hasil
                                  % Fungsi region splitting & merging
function [I,S] = imsplitmerge1(I, Dim, Th)
L=1; i=0;
px=1; py=1; S=[];  % Inisial. posisi region dan List-proses
[M,N,K]=size(I);
if Dim>= min(M,N)          % Maksimum ukuran region
    Dim = min(M,N)/2;
end
while  L>=i                % Kondisi pembacaan List-proses
  P=0;
  if (M>Dim && N>Dim)     % Kondisi ukuran region
     P=quadtree(I,I(py:py+M-1,px:px+N-1),...
          px,py,Th);
  end
if P>0            % Jika region terbagi catat dalam List-proses
      if i==0
          S=[S; P];
          i=i+1;
      else
          S=[S(1:i-1,:); P; S(i+1:end,:)];
      end
  else                 % Jika tidak periksa sub-region berikutnya
         i=i+1;
  end
  if i<=L            % Jika List-proses belum semua diperiksa
     M=S(i,3);       % Periksa region ke-i dalam List-proses
     N=S(i,4);
     px=S(i,2); 
     py=S(i,1);
  end
  L=length(S);
end    % Kembali ke while  hingga List-proses selesai diperiksa
                       % Petakan region yang terbentuk ke citra asli
m=S(:,1); n=S(:,2);
Vy=S(:,3); Vx=S(:,4);
L=length(m);
for i=1:L    % Beri warna putih (255) pada batas antar region
    I(m(i):m(i)+Vy(i)-1,n(i),:)=255;
    I(m(i),n(i):n(i)+Vx(i)-1,:)=255;
end
I(end,:,:)=255;
I(:,end,:)=255;

function S = quadtree(Im, I, px, py, Th)
[M,N,K]=size(I);
Dimy=floor(M/2);  Dimx=floor(N/2); S=0;
if (max(max(I))-min(min(I)))>Th
Max1=max(max(I(1:Dimy,1:Dimx)));
Min1=min(min(I(1:Dimy,1:Dimx)));
Max2=max(max(I(1:Dimy,Dimx+1:N)));
Min2=min(min(I(1:Dimy,Dimx+1:N)));
Max3=max(max(I(Dimy+1:M,1:Dimx)));
Min3=min(min(I(Dimy+1:M,1:Dimx)));
Max4=max(max(I(Dimy+1:M,Dimx+1:N)));
Min4=min(min(I(Dimy+1:M,Dimx+1:N)));
if Max1-Min2<=Th && Max2-Min1<=Th && ...  
    Max2-Min4<=Th && Max4-Min2<=Th
    S=[py px Dimy Dimx; py Dimx+px 0 N-Dimx; ... 
    Dimy+py px M-Dimy Dimx; Dimy+py Dimx+...
     px M-Dimy 0]
elseif Max4-Min2<=Th && Max2-Min4<=Th &&... 
          Max3-Min4<=Th && Max4-Min3<=Th
    S=[py px Dimy Dimx; py Dimx+px Dimy N- ... 
    Dimx; Dimy+py px M-Dimy Dimx; Dimy+py ... 
    Dimx+px 0 0]
 elseif Max3-Min1<=Th && Max1-Min3<=Th &&... 
           Max3-Min4<=Th && Max4-Min3<=Th
     S=[py px Dimy Dimx; py Dimx+px Dimy N-... 
     Dimx; Dimy+py px M-Dimy 0; Dimy+py... 
     Dimx+px 0 N-Dimx];
elseif Max3-Min1<=Th && Max1-Min3<=Th &&... 
          Max1-Min2<=Th && Max2-Min1<=Th
     S=[py px Dimy Dimx; py Dimx+px 0 N-Dimx;... 
     Dimy+py px M-Dimy 0; Dimy+py Dimx+px M-... 
     Dimy N-Dimx];
 elseif Max1-Min2<=Th && Max2-Min1<=Th
     S=[py px Dimy Dimx; py Dimx+px 0 N-Dimx;... 
     Dimy+py px M-Dimy Dimx; Dimy+py Dimx+...
     px M-Dimy N-Dimx];
 elseif Max2-Min4<=Th && Max4-Min2<=Th
     S=[py px Dimy Dimx; py Dimx+px Dimy N-... 
     Dimx; Dimy+py px M-Dimy Dimx; Dimy+py...
     Dimx+px M-Dimy 0]; 
 elseif Max3-Min4<=Th && Max4-Min3<=Th
      S=[py px Dimy Dimx; py Dimx+px Dimy N-... 
      Dimx; Dimy+py px M-Dimy Dimx; Dimy+py... 
      Dimx+px 0 N-Dimx];
 elseif Max3-Min1<=Th && Max1-Min3<=Th
     S=[py px Dimy Dimx; py Dimx+px Dimy N-... 
     Dimx; Dimy+py px M-Dimy 0; Dimy+py...
     Dimx+px M-Dimy N-Dimx]; 
end
if S==0
    S=[py px Dimy Dimx; py Dimx+px Dimy N-... 
    Dimx; Dimy+py px M-Dimy Dimx; Dimy+py ...
    Dimx+px M-Dimy N-Dimx];
end
end
return;
