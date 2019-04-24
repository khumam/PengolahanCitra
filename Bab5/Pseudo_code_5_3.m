function SegmentasiCitra()
clear all;
Im=double(imread('brain_tumor_fluorescent.jpg'));
figure(1), imshow(uint8(Im));title('Citra Asli');
p = impoint(gca,[]);            % pembacaan posisi pixel
p = wait(p);                  % klik 2 kali pada warna area 
x=round(p(1,1));              % yang ingin disegmentasi
y=round(p(1,2));
RGB=Im(y,x,:);           % warna referensi ruang RGB
Th=47;                               % tentukan nilai threshold
                               % Konversi warna pixel referensi
HSV=RGB2HSV(RGB);
HCL=RGB2HCL(RGB);
Hhcl=HCL(:,:,1);         % warna referensi ruang HCL
Chcl1=HCL(:,:,2);
Lhcl=HCL(:,:,3);
H1=HSV(:,:,1);           % warna referensi ruang HSV
S1=HSV(:,:,2);
V1=HSV(:,:,3);
        % Konversi Citra ke ruang warna HSV dan HCL
citra_hsv=RGB2HSV(Im);
citra_hcl=RGB2HCL(Im);
[m,n,l]=size(citra_hsv);                     % ukuran citra 
                                  % Inisialisasi matriks citra hasil
cit_hasilHSV(1:m,1:n,1:l)= uint8(0);  
cit_hasilRGB(1:m,1:n,1:l)= uint8(0);
cit_hasilHCL(1:m,1:n,1:l)= uint8(0);
 
for i=1:m                        %  hitung jarak warna RGB
    for j=1:n
       dR=(RGB(1,1,1)-Im(i,j,1))^2;
       dG=(RGB(1,1,2)-Im(i,j,2))^2;
       dB=(RGB(1,1,3)-Im(i,j,3))^2;
       if sqrt(dR + dG + dG)<=Th     % warna similar?
           cit_hasilRGB(i,j,:)= Im(i,j,:);
       end
                                       %  hitung jarak warna HSV
       dH=citra_hsv(i,j,1)-H1;
       S2=citra_hsv(i,j,2);
       dV=(citra_hsv(i,j,3)-V1)^2;
       Dcyl=sqrt(dV + S1^2+S2^2 - 2*S1*S2*cos(dH));
       if Dcyl <=Th                        %  warnanya similar?
           cit_hasilHSV(i,j,:)= Im(i,j,:);
       end;
                                          %  hitung jarak warna HCL
       dHhcl=citra_hcl(i,j,1)-Hhcl;
       Chcl2=citra_hcl(i,j,2);
       dLhcl=(citra_hcl(i,j,3)-Lhcl)^2;
       AL = 1.4456; 
       ACH = abs(dHhcl) + (0.16*pi/180);
       dC= Chcl1^2+Chcl2^2;
       dCh=2*Chcl1*Chcl2*cos(dHhcl);
       Dhcl=sqrt(AL*dLhcl+ACH*(dC - dCh));
       if Dhcl <=Th                       % warnanya similar?
           cit_hasilHCL(i,j,:)= Im(i,j,:);
       end;
    end;
end;
                 %  Tampilkan citra hasil 
figure, imshow(cit_hasilHSV);
figure, imshow(cit_hasilRGB);
figure, imshow(cit_hasilHCL);

