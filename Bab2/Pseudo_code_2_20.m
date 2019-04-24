clear all;                        % kosongkan semua variabel dalam sistim memori
f=(imread('image8_gray.bmp'));    % baca file citra ‘image8_gray.bmp’, simpan dalam matriks f
B=[1 1 1; 1 1 1; 1 1 1];          % Set matriks B dengan elemen 8 connectivity
figure(1), imshow(f);             % tampilkan citra f
[I,J] = size(B);                  % baca ukuran matriks B 
I=floor(I/2); 
J=floor(J/2);
[N,M] = size(f);                  % baca ukuran citra f
for  n = I+1 : N-I,
    for  m = J+1 : M-J,
        dilasi=0;
        for i=-I:I
            for j=-J:J
                 dilasi = max(B(I+1+i,J+1+j)*f(n+i,m+j),dilasi);  % tentukan nilai maksimum dilasi 
            end
        end  
         Citra_dilasi(n,m) = dilasi;   % simpan nilai dilasi dalam matriks citra dilasi
    end                                                   
end
 figure(2), imshow((Citra_dilasi));   % tampilkan hasil dilasi citra gray level
Citra_dilasi1 =  imdilate(f,B);       % Citra dilasi menggunakan fungsi dilasi pada Matlab
 figure(3), imshow(Citra_dilasi1);    % tampilkan hasil dilasi citra gray level.
