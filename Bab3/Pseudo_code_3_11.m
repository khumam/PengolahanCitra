function [H,C,L] = rgb2hslImage(R,G,B)
if nargin == 1       
  B = double(R(:,:,3)); G = double(R(:,:,2)); R = double(R(:,:,1));
end
 [N,M] = size(R);    gamma=30;                   % set nilai gama
for n=1:N,
    for m=1:M,
        r=R(n,m); g=G(n,m); b=B(n,m);
         Max = max(r,max(g,b));     		     % hitung nilai maksimum
         Min = min(r,min(g,b));     		     % hitung nilai minimum
         if Max==0 Q=1.0;      
            else Q=exp((Min*gamma)/(Max*100.0)); % hitung nilai Q
         end
         rg=(r-g); gb=(g-b);
         C(n,m)=(abs(b-r)+abs(rg)+abs(gb))*Q/(3.0);  % hitung nilai C
         L(n,m) =(Q*Max+(Q-1.0)*Min)/2.0;            % hitung nilai L
         H(n,m)=atan(gb/rg);                  		 % hitung nilai H
         if(C(n,m)==0) H(n,m)=0.0;
            elseif (rg>=0 && gb>=0)  H(n,m)= 2*H(n,m)/3;
            elseif ((rg>=0) && gb<0) H(n,m)=4*H(n,m)/3;
    elseif (rg<0 && gb>=0)  H(n,m)= pi + 4*H(n,m)/3;
            elseif ((rg<0) && gb<0 ) H(n,m)= 2*H(n,m)/3 - pi;
         end;
    end
end
if nargout < 2
  H = cat(3,H,C,L);
end
