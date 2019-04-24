clear all; 
f=double(imread('Lena.bmp'));  % baca citra Lena  

%%  Hitung matriks DCx dan DCy
c0=1/(2^0.5);                  % seting konstanta 
n=8;                           % seting ukuran matriks
for u = 1:n                    % loop menghitung matriks DCx
    if u == 1  cu = c0;
    else cu=1; 
    end
    for x = 1:n 
        DCx(u,x)=((2/n)^0.5)*cu*cos(((2*(x-1)+ 1)*pi*(u-1))/(2*n));
    end
end
for y = 1:n                      % loop menghitung matriks DCy
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
%%  Hitung matrikx invers DCx dan invers DCy
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
%%
 iDCT=round(iDCx*(F*iDCy))                % menghitung rekonstruksi iDCT
 %%
 
 f(1:n,1:n,1)                      % data blok asli
