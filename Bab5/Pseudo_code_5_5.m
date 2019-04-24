function  regiongrowingseg()
clear all;
Im=double(imread('brain_tumor_fluorescent.jpg'));
figure(1), imshow(uint8(Im));title('Citra Asli');
p = impoint(gca,[]);        % pembacaan posisi pixel
p = wait(p);                % klik 2 kali pada warna area 
x=round(p(1,1));            % yang ingin disegmentasi
y=round(p(1,2));
RGB=Im(y,x,:);              % intensitas/warna seed point
Th=47;                      % set nilai threshold
[M,N,L]=size(RGB);
if  L ==1                                     % jika citra gray-level
     [SP,RG] = regiongrowingGray(Im,RGB,Th);
else                                          % jika citra berwarna
     [SP,RG] = regiongrowingHCL(Im,RGB,Th);
end                                               
figure(2), imshow(uint8(SP));title('Seed Points');
figure(3), imshow(uint8(RG));title('Region Growing');

function [SP,RG] = regiongrowingGray(Im,S,Th)
[m,n,l]=size(Im);      % ukuran citra 
SP(1:m,1:n)=0;         % inisialisasi matriks seed points
for i=1:m              % bentuk seed points 
    for j=1:n
        if abs(Im(i,j) - S)<=5   % seed point S, rentan 5
        SP(i,j)=Im(i,j);
        end
    end
end
RG=SP;                  % diawal region growing = SP
for i=2:m-1             % proses pertumbuhan region dari
    for j=2:n-1         % kiri ke kanan dan atas ke bawah
        Sd=RG(i,j);       
        if (Sd>0)                % bila seed point, hitung jarak
        F=Im(i-1:i+1,j-1:j+1);   % 8 pixel tetangga
        D=abs(F-S);
        MinD=min(min(D));
        AD=(sum(sum(D)))/9.0;
        if  (AD<=Th) || MinD<=Th      % jarak <= Th
            RG(i-1:i+1,j-1:j+1)=F;    % F bagian seed pints
        end
        end
    end
end
 
for i=m-1:-1:2          % proses pertumbuhan region dari
    for j=n-1:-1:2      % kanan ke kiri dan bawah ke atas
        Sd=RG(i,j);       
        if (Sd>0)                % bila seed point, hitung jarak
        F=Im(i-1:i+1,j-1:j+1);   % 8 pixel tetangga
        D=abs(F-S);
        MinD=min(min(D));
        AD=(sum(sum(D)))/9.0;
        if  (AD<=Th) || MinD<=Th     % jarak <= Th
            RG(i-1:i+1,j-1:j+1)=F;   % F bagian seed pints
        end
        end
    end
end
return
function [SP,RG] = regiongrowingHCL(Im,S,Th)
Ref=RGB2HCL(S);         % konversi warna seed point
HRef=Ref(1,1,1); 
CRef=Ref(1,1,2); 
LRef=Ref(1,1,3);
HCL=RGB2HCL(Im);       % konversi warnacitra
[m,n,l]=size(Im);      % ukuran citra 
SP(1:m,1:n,1:l)=0;     % inisialisasi matriks seed points
AL = 1.4456;   
AC = (0.16*pi/180);
for i=1:m              % bentuk seed points
    for j=1:n
      dH=HCL(i,j,1)-HRef;
       C=HCL(i,j,2);
       dC= C^2+CRef^2;
       dL=(HCL(i,j,3)-LRef)^2;
       ACH = abs(dH) + AC;
       dCh=2*CRef*C*cos(dH);
       Dhcl=sqrt(AL*dL+ACH*(dC - dCh));
       if Dhcl <=5.0              % seed point S, rentan 5
           SP(i,j,:)=Im(i,j,:);
       end;
    end
end
RG=SP;                    % diawal region growing = SP
for i=2:m-1               % proses pertumbuhan region dari
    for j=2:n-1           % kiri ke kanan dan atas ke bawah
       S=sum(RG(i,j,1:3));
       if (S>0)                    % bila seed point, hitung jarak
        dH=HCL(i-1:i+1,j-1:j+1,1)-HRef;
       C=HCL(i-1:i+1,j-1:j+1,2);
       dL=(HCL(i-1:i+1,j-1:j+1,3)-LRef).^2;
       ACH = abs(dH) + AC;
       dC= (C.^2+CRef^2) - 2*CRef*(C.* cos(dH));
       Dm=((AL*dL)+(ACH.*dC)).^0.5;
       DMin=min(min(Dm));
       Dhcl=sum(sum(Dm))/9.0;
       if Dhcl <=Th || DMin<=Th               % jarak <= Th
            RG(i-1:i+1,j-1:j+1,:)=Im(i-1:i+1,j-1:j+1,:);
       end;
       end
    end
end
for i=m-1:-1:2          % proses pertumbuhan region dari
    for j=n-1:-1:2      % kanan ke kiri dan bawah ke atas
       S=sum(RG(i,j,1:3));
       if (S>0)                    % bila seed point, hitung jarak
        dH=HCL(i-1:i+1,j-1:j+1,1)-HRef;
       C=HCL(i-1:i+1,j-1:j+1,2);
       dL=(HCL(i-1:i+1,j-1:j+1,3)-LRef)^2;
       ACH = abs(dH) + AC;
       dC= C.^2+CRef^2 - 2*CRef*(C.* cos(dH));
       Dm=((AL*dL)+(ACH.*dC)).^0.5;
       DMin=min(min(Dm));
       Dhcl=sum(sum(Dm))/9.0;
       if  Dhcl <=Th || DMin<=Th              % jarak <= Th
           RG(i-1:i+1,j-1:j+1,:)=Im(i-1:i+1,j-1:j+1,:);
       end
       end
    end
end
return

