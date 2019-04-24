clear all;
I=imread('face2.jpg');
I1=I;
[N,M,L]=size(I);
% Segmentasi citra dalam ruang warna RGB
Q=4;                         % Set jumlah kuantisasi
Th=255/Q;                    % hitung rentan nilai Th
RGBidx=round(double (I)/Th); %  indeks warna citra
RGBpeta=round(RGBidx*Th);    % peta warna citra
figure(1), imshow(I);               % tampilkan citra asli
figure(2), imshow(uint8(RGBpeta));  % peta wara citra 

for n=1:N             % cari batas antara dua warna arah x
    for m=1:M-1
        a=(RGBidx(n,m,1)-RGBidx(n,m+1,1))^2;
        b=(RGBidx(n,m,2)-RGBidx(n,m+1,2))^2;
        c=(RGBidx(n,m,3)-RGBidx(n,m+1,3))^2;
        if sqrt(a+b+c)>0           % bila dua warna berbeda 
            I(n,m,:)=255;          % beri batas warna putih 
        end
    end
end

for n=1:N-1        % cari batas antara dua warna arah y
    for m=1:M
        d=(RGBidx(n,m,1)-RGBidx(n+1,m,1))^2;
        e=(RGBidx(n,m,2)-RGBidx(n+1,m,2))^2;
        f=(RGBidx(n,m,3)-RGBidx(n+1,m,3))^2;
        if sqrt(d+e+f)>0          % bila dua warna berbeda
            I(n,m,:)=255;         % beri batas warna putih 
        end
    end
end
figure(3), imshow(uint8(I)); % tampilkan citra hasil seg.

                  % Segmentasi citra dalam ruang warna HSV
HSV=rgb2hsv(I1);  % Konversi citra RGB ke HSV
QH=6.0;           % Set jumlah kuantisasi komponen H
 HTh=1/QH;                     
QS=3.0;          % Set jumlah kuantisasi komponen S
STh = 1/QS;  
QV=4.0;           % Set jumlah kuantisasi komponen V
VTh= 1/QV;
                              % Bentuk indeks warna citra  
HSVidx =  round(HSV(:,:,1)/ HTh)*HTh*2*pi;
HSVidx(:,:,2) = round(HSV(:,:,2)/STh);
HSVidx(:,:,3) = round(HSV(:,:,3)/VTh);
                  % Bentuk peta atau palette warna citra
HSVpeta = round(HSV(:,:,1)/ HTh)*HTh;
HSVpeta(:,:,2)=HSVidx(:,:,2)*STh;
HSVpeta(:,:,3)=HSVidx(:,:,3)*VTh;

for n=1:N              % Reinisialisasi area gray level
    for m=1:M
        if HSVidx(n,m,3)==0 || HSVidx(n,m,2)==0
            HSVidx(n,m,1)=0;  HSVidx(n,m,2)=0;
            HSVpeta(n,m,1)=0; HSVpeta(n,m,2)=0;
        end
    end
end
figure(4), imshow((HSVpeta),[]);     % peta wara citra
for n=1:N                % cari batas antara dua warna arah x
    for m=1:M-1
        S1=HSVidx(n,m,2); S2=HSVidx(n,m+1,2);
       dH= HSVidx(n,m,1)-HSVidx(n,m+1,1);
        Cos=2*S1*S2*cos(dH);   
       dV=(HSVidx(n,m,3) - HSVidx(n,m+1,3))^2;
       if sqrt(dV+S1^2+S2^2-Cos)>0   % warna berbeda? 
           I1(n,m,:)=255;            % beri batas warna putih
       end
    end
end
for n=1:N-1           % cari batas antara dua warna arah y
    for m=1:M
        S1=HSVidx(n,m,2);  S2=HSVidx(n+1,m,2);
        dH= HSVidx(n,m,1) - HSVidx(n+1,m,1);
        Cos=2*S1*S2*cos(dH);
        dV=(HSVidx(n,m,3) - HSVidx(n+1,m,3))^2;
       if sqrt(dV+S1^2+S2^2-Cos)>0   % warna berbeda
          I1(n,m,:)=255;             % beri batas warna putih asli
        end
    end
end
figure(5), imshow(uint8(I1));  % tampilkan citra hasil 
