clear all;
HCL_solid(1:275,1:400,1:3)=128; % Inisialisasi matriks tampilan
HCL_Edge(1:275,1:400,1:3)=128;  % ruang HCL
gamma=10;		     		    % set nilai gama
for b=0:255
  for g=0:255
    for r=0:255
         Max = max(r,max(g,b));  Min = min(r,min(g,b));	 % maksmum,  minimum
         if Max==0 Q=1.0;	   
            else Q=exp((Min*gamma)/(Max*100.0));   	% hitung nilai Q
         end
              L=(Q*Max+(Q-1.0)*Min)/2.0;	        % hitung nilai L
              rg=(r-g); gb=(g-b);
              C=(abs(b-r)+abs(rg)+abs(gb))*Q/(3.0);  % hitung nilai C
              H=atan(gb/rg); 	 	          	% hitung nilai H
         if(C==0) H=0.0;
            elseif (rg>=0 && gb>=0)  H= 2*H/3;
            elseif ((rg>=0) && gb<0) H=4*H/3;
    elseif (rg<0 && gb>=0)  H= pi + 4*H/3;
            elseif ((rg<0) && gb<0 ) H= 2*H/3 - pi;
   end;
          j=200 + round(C*cos(H));           % koordinat silinder 3-D
          i=250 - round(C*sin(H)/4.0 + L);   % ke tampilan 2-D
          HCL_solid(i,j,1)=r;              	 % Letakan warna R, G, B  pada 
          HCL_solid(i,j,2)=g;              	 % matriks tampilan 3-D solid
          HCL_solid(i,j,3)=b;
                                             % RGB ke HCL, 3-G edge
          if ((r==b&&g==255) || (r==g&&b==255) || (b==g&&r==255) || ...  
               (r==255&&g==255) || (g==255&&b==255) || ...
               (b==255&&r==255) || (b==0&&g==0)|| (r==0&&g==0)|| ...
               (b==0&&r==0) || (b==r&&g==0) || (r==g&&b==0)||... 
               (b==g&&r==0) || (b==255&&r==0) || (b==255&&g==0) || ... 
               (g==255&&r==0) || (g==255&&b==0) || (r==255&&b==0)|| ... 
               (r==255&&g==0) || (r==g&&g==b))
        HCL_Edge(i,j,1)=r;           		 % Letakan warna R, G, b  pada 
      HCL_Edge(i,j,2)=g;         			 % matriks tampilan 3-D edge
      HCL_Edge(i,j,3)=b;
  end;
    end;
  end;
end;
figure(1), imshow(uint8(HCL_solid));   % Tampilkan ruang warna 
figure(2), imshow(uint8(HCL_Edge));    % HCL solid dan edge 
