function betaS=betaScal(S,np)
    maxs=max(S,[],1:np);
    mins=min(S,[],1:np);
    ubS=squeeze(maxs);
    lbS=squeeze(mins);
    ulbs=ubS-lbS;
    betaS=norm(ulbs(:));
end