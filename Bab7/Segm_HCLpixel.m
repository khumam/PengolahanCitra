function [Im_seg,Im_seg1] = Segm_HCLpixel(Im,Wref,Th)
HCL=RGB2HCL(Wref);                       % Konversi warna ref. ke ruang warna HCL
Hhcl=HCL(:,:,1); Chcl1=HCL(:,:,2);
Lhcl=HCL(:,:,3);
citra_hcl=RGB2HCL(Im);                             % Konversi Citra ke ruang warna HCL
[m,n,l]=size(Im);
Im_seg(1:m,1:n,1:l)=uint8(0);
for i=1:m
    for j=1:n
       dHhcl=citra_hcl(i,j,1)-Hhcl;
       Chcl2=citra_hcl(i,j,2);
       dLhcl=(citra_hcl(i,j,3)-Lhcl)^2;
       AL = 1.4456; 
       ACH = abs(dHhcl) + (0.16*pi/180);
       dC= Chcl1^2+Chcl2^2;
       dCh=2*Chcl1*Chcl2*cos(dHhcl);
       Dhcl=sqrt(AL*dLhcl+ACH*(dC - dCh));       % Hitung jarak warna pixel citra
       if Dhcl <=Th                                                               % jika <= warna referensi
           Im_seg(i,j,:)= Im(i,j,:);                                            % ekstraksi pixel tersebut
       end;
    end;
end;
