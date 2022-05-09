function  [Bild] = GWVerlauf(Richtung)
n=256;
M=[zeros(1,n)];
if Richtung == "Links"
        for i=1:n
            for a=1:n
                M(a,i)=i-1;
            end
        end
elseif Richtung== "Rechts"
         for i=1:n
            for a=1:n
                M(a,i)=n-i;
            end
         end
end
Bild=M;
end