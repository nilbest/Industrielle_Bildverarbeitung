function Wert_intpol=intpol(X_Wert,Y_Reihe,Art_der_Interpolation)

switch Art_der_Interpolation
    case "Nearest_Neighbour"
        %2yWertw!
        if round(X_Wert)==2
            Wert_intpol=Y_Reihe(1);
        else
            Wert_intpol=Y_Reihe(2);
        end

    case "linear"
        u_0=floor(X_Wert);
        a=X_Wert-u_0;
        Wert_intpol=Y_Reihe(1)*(1-a)+Y_Reihe(2)*a;
        
    case "kubisch"
        %4ywerte!

    otherwise
        Fehler="Falscher FilterTyp übergeben"
end