clear all; 
f=double(imread('Lena.bmp'));  % baca citra Lena  

%%  Pembuatan matriks DC
c0=1/(2^0.5);                                 % seting konstanta 
n=8;                                          % seting ukuran matriks
for u = 1:n                                   % loop menghitung matriks DCx
    if u == 1  cu = c0;
    else cu=1; 
    end
    for x = 1:n 
        DCx(u,x)=((2/n)^0.5)*cu*cos(((2*(x-1)+ 1)*pi*(u-1))/(2*n));
    end
end
for y = 1:n                                    % loop menghitung matriks DCy
    for v = 1:n 
        if v == 1  cv = c0;
        else cv=1; 
        end
        DCy(y,v)=((2/n)^0.5)*cv*cos(((2*(y-1)+ 1)*pi*(v-1))/(2*n));
    end
end
%%
%%  
F=(DCx*f(1:n,1:n,1))*DCy           % menghitung DCT blok 8x8 citra f

%%

%% Proses kuantisasi
Q = [2  2   3   4   5   6   8   11              % set matriks Q; 
        2   2   2   4   5   7   9   11
        3   2   3   5   7   9   11  12
        4   4   5   7   9   11  12  12
        5   5   7   9   11  12  12  12
        6   7   9   11  12  12  12  12
        8   9   11  12  12  12  12  12
      11  11  12  12  12  12  12  12];
for i=1:8                                      % loop proses kuantisasi
    for j=1:8
        Fq(i,j)=round(F(i,j)/Q(i,j));
    end
end
Fq
%%
%%  Proses kuantisasi invers
for i=1:8                                              % loop proses dekuantisasi
    for j=1:8
        Fdq(i,j) = Fq(i,j)*Q(i,j);
    end
end

%%

%% Pembentukan matriks DC invers
 for x = 1:n                       % loop menghitung matriks iDCx
    for u = 1:n 
        if u == 1  cu = c0;
        else cu=1; 
        end
        iDCx(x,u)=((2/n)^0.5)*cu*cos(((2*(x-1)+ 1)*pi*(u-1))/(2*n));
    end
end
for v = 1:n                                       % loop menghitung matriks iDCy
    if v == 1  cv = c0;
    else cv=1; 
    end
    for y = 1:n 
        iDCy(v,y)=((2/n)^0.5)*cv*cos(((2*(y-1)+ 1)*pi*(v-1))/(2*n));
    end
end
%%
%% % menghitung DCT invers (rekonstruksi)
 iDCT=round(iDCx*(Fdq*iDCy))                % menghitung rekonstruksi iDCT
 
 %%
 f(1:n,1:n,1)                      % data blok asli
