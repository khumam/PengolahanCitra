clear all;  
f=double(imread('Lena.bmp'));  % baca citra Lena

%%  Hitung matriks QDCx dan QDCy
Q=4.5;                        % seting nilai Q
c0=1/(2^0.5);                 % seting konstanta 
n=8;                          % seting ukuran matriks
for u = 1:n                   % loop menghitung matriks QDCx
    if u == 1  cu = c0;
    else cu=1; 
    end
    for x = 1:n 
        QDCx(u,x)=((2/(n*Q))^0.5)*cu*cos(((2*(x-1)+ 1)*pi*(u-1))/(2*n));
    end
end
QDCy= QDCx';                   % menghitung matriks QDCy
%%
%%
F = (QDCx*f(1:n,1:n,1))*QDCy       % menghitung QDCT

%%
%%  Menghitung matriks iQDCx dan iQDCy
 for x = 1:n                              % loop menghitung matriks iQDCx
    for u = 1:n 
        if u == 1  cu = c0;
        else cu=1; 
        end
        iQDCx(x,u)=(( (2*Q)/n)^0.5)*cu*cos(((2*(x-1)+ 1)*pi*(u-1))/(2*n));
    end
end
iQDCy= iQDCx';                     % menghitung matriks iQDCy
%%
%% proses rekonstruksi
iQDCT=round(iQDCx*(F*iQDCy))       % menghitung iQDCT

%%
f(1:n,1:n,1)     % blok asli
