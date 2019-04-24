%%% Program konversi warna RGB2HCL %%%%%%%%
%%%  Oleh : Sarifuddin Madenda     %%%%%%%%

clear all;
I=imread('images.png');
%I=imread('C:\Users\Sarifuddin\Documents\Gunadarma\OniMarlin\data\000007.JPG');
figure(1),imshow(I);
[N,M,L]=size(I)
HCL_Edge(1:225,1:400,1:3)=128;    % ruang HCL
gamma=10;		     % set nilai gama
for n=1:N
    for m=1:M
       b=double(I(n,m,3)); g=double(I(n,m,2)); r=double(I(n,m,1));
       Max = max(r,max(g,b));	    % hitung nilai maksimum
         Min = min(r,min(g,b));	    % hitung nilai minimum
         if Max==0 Q=1.0;	   
            else Q=exp((Min*gamma)/(Max*100.0));   % hitung nilai Q
         end
              L=(Q*Max+(Q-1.0)*Min)/2.0;	          % hitung nilai L
              rg=(r-g); gb=(g-b);
              C=(abs(b-r)+abs(rg)+abs(gb))*Q/(3.0);     % hitung nilai C
              H=atan(gb/rg); 	 	          % hitung nilai H
         if(C==0) H=0.0;
            elseif (rg>=0 && gb>=0)  H= 2*H/3;
            elseif ((rg>=0) && gb<0) H=4*H/3;
            elseif (rg<0 && gb>=0)  H= pi + 4*H/3;
            elseif ((rg<0) && gb<0 ) H= 2*H/3 - pi;
         end;
j=200 + round(C*cos(H));                % koordinat silinder 3-D
i=200 - round(C*sin(H)/4.0 + L);     % ke tampilan 2-D

       HCL_Edge(i,j,1)=r;
        HCL_Edge(i,j,2)=g;
        HCL_Edge(i,j,3)=b;
    end;
end;

for b=0:255
  for g=0:255
    for r=0:255
       
         if ((r==b&&g==255) || (r==g&&b==255) || (b==g&&r==255) ...
           || (r==255&&g==255) || (g==255&&b==255) || (b==255&&r==255)...
           || (b==0&&g==0)|| (r==0&&g==0)|| (b==0&&r==0) || (b==r&&g==0)...
           || (r==g&&b==0)|| (b==g&&r==0) || (b==255&&r==0)...
           || (b==255&&g==0) || (g==255&&r==0) || (g==255&&b==0) || ...
           (r==255&&b==0)|| (r==255&&g==0) || (r==g&&g==b)) || (H==pi/18) || (H==-pi/18)
       
       Max = max(r,max(g,b));	    % hitung nilai maksimum
         Min = min(r,min(g,b));	    % hitung nilai minimum
         if Max==0 Q=1.0;	   
            else Q=exp((Min*gamma)/(Max*100.0));   % hitung nilai Q
         end
              L=(Q*Max+(Q-1.0)*Min)/2.0;	          % hitung nilai L
              rg=(r-g); gb=(g-b);
              C=(abs(b-r)+abs(rg)+abs(gb))*Q/(3.0);     % hitung nilai C
              H=atan(gb/rg); 	 	          % hitung nilai H
         if(C==0) H=0.0;
            elseif (rg>=0 && gb>=0)  H= 2*H/3;
            elseif ((rg>=0) && gb<0) H=4*H/3;
            elseif (rg<0 && gb>=0)  H= pi + 4*H/3;
            elseif ((rg<0) && gb<0 ) H= 2*H/3 - pi;
         end;
        j=200 + round(C*cos(H));                % koordinat silinder 3-D
        i=200 - round(C*sin(H)/4.0 + L);        % ke tampilan 2-D
       
        HCL_Edge(i,j,1)=r;
        HCL_Edge(i,j,2)=g;
        HCL_Edge(i,j,3)=b;
         end;
    end;
  end;
end;
figure(2), imshow(uint8(HCL_Edge));
imwrite(uint8(HCL_Edge),'HCL_image1.png');
    