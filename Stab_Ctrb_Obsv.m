%Studio la stabilita' del sistema
zeri = roots([4 3.698e-32 401])
poli = pole(CompleteSystem)
%Studio la controllabilita' del sistema
%Definisco la matrice di controllabilita'
CtrbMatrix = ctrb(CompleteSystem);
%Calcolo il rango della matrice di controllabilita' e della matrice A del
%sistema 
rankCtrb = rank(CtrbMatrix);
rankMatrixA = rank(CompleteSystem.A);
%Se la matrice di controllabilita' ha rango massimo il sistema e'
%completamente controllabile
if rankCtrb == rankMatrixA 
    msg = 'Sistema completamente controllabile';
else
    msg = 'Sistema non completamente controllabile';
end
msgbox(msg);

%Studio l' osservabilita' del sistema
%Definisco la matrice di osservabilita'
ObsvMatrix = obsv(CompleteSystem);
%Calcolo il rango della matrice di osservabilita' e della matrice A del
%sistema 
rankObsv = rank(ObsvMatrix);
%Se la matrice di osservabilita' ha rango massimo il sistema e'
%completamente osservabile
if rankObsv == rankMatrixA 
    msg = 'Sistema completamente osservabile';
else
    msg = 'Sistema non completamente osservabile';
end
msgbox(msg);

