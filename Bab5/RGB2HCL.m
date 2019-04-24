% % Fungsi Konversi Citra ke ruang warna HCL
function HCL=RGB2HCL(RGB)
[M,N,L]=size(RGB);
HCL(1:M,1:N,1:L)=0;
gamma=30;
for m=1:M
   for n=1:N
         % hitung nilai maksimum, minimum dan Q
         r=RGB(m,n,1); g=RGB(m,n,2); b=RGB(m,n,3);
         Max = max(r,max(g,b));     
         Min = min(r,min(g,b));     
         if Max==0 Q=1.0;             
            else Q=exp((Min*gamma)/(Max*100.0));   
         end
             % hitung nilai L, C dan H
              L=(Q*Max+(Q-1.0)*Min)/2.0;    
              rg=(r-g); gb=(g-b);                       
              C=(abs(b-r)+abs(rg)+abs(gb))*Q/(3.0);                           
              H=atan(gb/rg);                             
         if (C==0) H=0.0;
            elseif (rg>=0 && gb>=0)  H= 2*H/3;
            elseif ((rg>=0) && gb<0) H=4*H/3;
            elseif (rg<0 && gb>=0)  H= pi + 4*H/3;
            elseif ((rg<0) && gb<0 ) H= 2*H/3 - pi;
         end;
         if H<0  H = 2*pi - H;
         end
         HCL(m,n,1)=H; HCL(m,n,2)=C; HCL(m,n,3)=L;
   end
end
return;