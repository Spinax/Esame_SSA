clc;clear;
% Definisco i blocchi che compongono il sistema partendo dalla loro
% funzione di trasferimento
sist1_tf = tf([1],[1 0 100]);
blockTF1 = ss(sist1_tf);
sist2_tf = tf([1],[1 0]);
blockTF2 = ss(sist2_tf);
gain_tf = tf([4]);
blockGain = ss(gain_tf);
%Definisco le interconnessioni tra i blocchi
blockPlusGainSys = parallel(blockTF1, blockGain);
sysWithoutFB = series(blockPlusGainSys, blockTF2);
CompleteSystem = feedback(sysWithoutFB, 1);
%Stampo la funzione di trasferimento
tf(CompleteSystem)
%Stampo le matrici che compongono l'equazione di stato
CompleteSystem







