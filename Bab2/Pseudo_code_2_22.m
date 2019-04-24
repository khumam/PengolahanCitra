clear all;                      % kosongkan semua variabel dalam sistim memori
f=(imread('image8_gray.bmp'));    % baca file citra ‘image8_gray.bmp’, simpan dalam matriks f
B=[1 1 1; 1 1 1; 1 1 1];        % Set matriks B dengan elemen 8 connectivity
figure(1), imshow(f);           % tampilkan citra f
 [I,J] = size(B);               % baca ukuran matriks B 
I=floor(I/2); 
J=floor(J/2);
[N,M] = size(f);                % baca ukuran citra f
for  n = I+1 : N-I,
    for  m = J+1 : M-J,
        erosi=255;
        for i=-I:I
            for j=-J:J
                 erosi = min(B(I+1+i,J+1+j)*f(n+i,m+j),erosi);  % tentukan nilai maksimum erosi 
            end
        end  
         Citra_erosi(n,m) = erosi;    % simpan nilai erosi dalam matriks citra erosi
    end                                                   
end
 figure(2), imshow((Citra_erosi));    % tampilkan hasil erosi citra gray level
Citra_erosi1 =  imerode(f,B);         % Citra erosi menggunakan fungsi erosi pada Matlab
 figure(3), imshow(Citra_erosi1);     % tampilkan hasil erosi citra gray level.
