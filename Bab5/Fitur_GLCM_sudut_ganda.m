function [mean,var,cont, diss, hom,Corr,ent, enr] = Fitur_GLCM_sudut_ganda(CM)
 
P=CM/sum(sum(CM));
[N,M]=size(CM);
cont=0; diss=0; hom=0; ent=0; enr=0; mean=0; 
for n=1:N
    mX=0;
   for m=1:M
      mX=mX+ P(n,m); 
      diss = diss + abs((n-1)-(m-1))*P(n,m);                                       % hitung kontras
      cont = cont + ((n-1)-(m-1))^2*P(n,m);                               % hitung dissimilarity
      hom = hom + P(n,m)/(1+abs((n-1)-(m-1)));                       % hitung homogenitas
      enr=enr+(P(n,m))^2;                                                                     % hitung energi
      if P(n,m)>0
         ent = ent - P(n,m)*log10(P(n,m));                                           % hitung entropy
      end
   end
   mean=mean+ (n-1)*mX;                                                                   % hitung mean
end
 var=0;                                                                                              % hitung variance
for n=1:N
    mX=0;
   for m=1:M
      mX=mX + P(n,m);
   end
   var=var + ((n-1)-mean)^2*mX;
end
 Corr=0;                                                                                              % hitung corelasi
for n=1:N
   for m=1:M
      Corr=Corr + ((n-1)*(m-1)*P(n,m));
   end
end
Corr=(Corr - mean^2)/(var);
