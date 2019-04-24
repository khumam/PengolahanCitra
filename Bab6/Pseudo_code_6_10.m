function Pseudo_code_6_10()
clear all;
f=double(imread('LenaGray.png'));
figure(1), imshow(uint8(f));     % Citra asli
Filter=FilterD8;                 % gunakan filter  D8
                                 %  Proses dekomposisi wavelet 4 skala
[LL, LH1, HL1, HH1 ]=DWT(f,Filter);
[LL, LH2, HL2, HH2 ]=DWT(LL,Filter);
[LL, LH3, HL3, HH3 ]=DWT(LL,Filter);
[LL, LH4, HL4, HH4 ]=DWT(LL,Filter);
                                 % Satukan citra dekomposisi
WIm=[[[[LL/4 LH4; HL4 HH4]/2 LH3; HL3...
           HH3]/2 LH2; HL2 HH2] LH1; HL1 HH1];
figure(2), imshow(uint8(abs(WIm))); 
                                 %  Proses rekonstruksi wavelet 4 skala
f0=iDWT(LL, LH4, HL4, HH4,Filter);
f0=iDWT(f0, LH3, HL3, HH3,Filter);
f0=iDWT(f0, LH2, HL2, HH2,Filter);
f0=iDWT(f0, LH1, HL1, HH1,Filter);
 figure(3), imshow(uint8(f0));    % Citra rekonstruksi

function [LL LH HL HH]=DWT(f,Filter)
      L= blkproc(f,[8 8],'wavelet',Filter);
      LH=L(1:2:end, 2:2:end);
      HL=L(2:2:end, 1:2:end);
      HH=L(2:2:end, 2:2:end);
      LL=L(1:2:end,1:2:end);
function D8=FilterD8()
       d1=-0.010597402; d2=0.032883012;    
       d3=0.030841382; d4=-0.187034812;
       d5=-0.027983769; d6=0.630880768;   
       d7=0.714846571; d8=0.230377813;
       c1=-0.230377813; c2=0.714846571; 
       c3=-0.630880768; c4=-0.027983769;
       c5=0.187034812; c6=0.030841382; 
       c7=-0.032883012; c8=-0.010597402;
D8=[d1 d2 d3 d4 d5 d6 d7 d8
        c1 c2 c3 c4 c5 c6 c7 c8
        d7 d8 d1 d2 d3 d4 d5 d6
        c7 c8 c1 c2 c3 c4 c5 c6
        d5 d6 d7 d8 d1 d2 d3 d4
        c5 c6 c7 c8 c1 c2 c3 c4
        d3 d4 d5 d6 d7 d8 d1 d2
        c3 c4 c5 c6 c7 c8 c1 c2];

function [f]=iDWT(LL,LH,HL,HH,Filter)
     [M,N]=size(LL);
     L(1:2*M, 1:2*N)=0;
     L(1:2:end, 1:2:end)=LL;
     L(1:2:end, 2:2:end)=LH;
     L(2:2:end, 1:2:end)=HL;
     L(2:2:end, 2:2:end)=HH;
    f= blkproc(L,[8 8],' wavelet',inv(Filter));

function mt= wavelet(f,P)
     mt=P*f*P';
