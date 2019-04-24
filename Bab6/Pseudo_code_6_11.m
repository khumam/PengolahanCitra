function PSNR =psnr(ImRef, ImRek)
    ImRef=double(ImRef);
    ImRek=double(ImRek);
[N,M,L]=size(ImRef);
Im4=(ImRef(:,:,1)-ImRek(:,:,1)).^2 + (ImRef(:,:,2)- ImRek (:,:,2)).^2 + 
        (ImRef(:,:,3)- ImRek(:,:,3)).^2;
MSE=sum(sum(Im4))/(3*N*M);                %  hitung nilai MSE
if err~=0
    x=255^2;
   PSNR =10*log10(x/MSE);
else 
    PSNR ='tak hingga';
end;
return
