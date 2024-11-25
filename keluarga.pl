% Fakta: Hubungan keluarga dasar
ayah(rudi, auran).  
ayah(rudi, fadli).  
ayah(ruli, rasya).
ibu(wati, bayu). 
ibu(sutini, andika).

% Fakta tambahan: Kakek dan nenek
ayah(suparman, rudi). % Suparman adalah ayah dari Rudi
ayah(suparman, ruli). % Suparman adalah ayah dari Ruli
ibu(siti, rudi).      % Siti adalah ibu dari Rudi
ibu(siti, ruli).      % Siti adalah ibu dari Ruli

% Aturan: Mendefinisikan hubungan anak
anak(X, Y) :-
    ayah(Y, X);
    ibu(Y, X).
% X adalah anak Y jika Y adalah ayah atau ibu X

% Aturan: Mendefinisikan hubungan saudara
saudara(X, Y) :-
    ayah(Z, X), ayah(Z, Y),
    ibu(W, X), ibu(W, Y),
    X \= Y.
% X adalah saudara Y jika mereka memiliki ayah dan ibu yang sama, tetapi X bukan Y

% Aturan: Mendefinisikan hubungan kakek
kakek(X, Y) :-
    ayah(X, Z),
    (ayah(Z, Y); ibu(Z, Y)).
% X adalah kakek Y jika X adalah ayah dari ayah/ibu Y

% Aturan: Mendefinisikan hubungan nenek
nenek(X, Y) :-
    ibu(X, Z),
    (ayah(Z, Y); ibu(Z, Y)).
% X adalah nenek Y jika X adalah ibu dari ayah/ibu Y

% Aturan: Mendefinisikan hubungan cucu
cucu(X, Y) :-
    (ayah(Y, Z); ibu(Y, Z)),
    anak(X, Z).
% X adalah cucu Y jika Y adalah ayah/ibu dari orang tua X

% Aturan: Mendefinisikan hubungan paman/tante
paman_tante(X, Y) :-
    saudara(X, Z),
    (ayah(Z, Y); ibu(Z, Y)).
% X adalah paman/tante Y jika X saudara ayah/ibu Y
