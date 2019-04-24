clear all;                       % kosongkan semua variabel dalam sistim memori
f=im2bw(imread('biner3.bmp'));   % baca citra ‘biner3.bmp’, dan konversi menjadi citra biner 
B=[1 1 1; 1 1 1; 1 1 1];         % Set matriks B dengan elemen 8 connectivity
figure(1), imshow(f);            % tampilkan citra biner f
 [N,M] = size(f);                % baca ukuran citra f
[I,J] = size(B);                 % baca ukuran matriks B 
I=floor(I/2); 
J=floor(J/2);
for  n = I+1 : N-I,              % loop proses baris citra 
    for  m = J+1 : M-J,          % loop proses kolom citra
        dilasi=0;                % Inisalisasi nilai dilasi
        for i= -I:I              % loop proses dilasi
            for j= -J:J
                 bit_dilasi= bitand(B(I+1+i,J+1+j),f(n+i,m+j));    % opeasi logika AND 
                 dilasi= bitor(dilasi,bit_dilasi);                 % operasi logika OR 
            end
        end  
         Citra_dilasi(n,m) = dilasi;   % simpan hasil dilasi kedalam matriks citra_dilasi 
    end                                                   
end
 figure(2), imshow((Citra_dilasi));    % tampilkan citra hasil dilasi
 Citra_dilasi1 =  imdilate(f,B);       % Citra dilasi menggunakan fungsi dilasi pada Matlab
 figure(3), imshow(Citra_dilasi1);     % tampilkan citra hasil dilasi.
