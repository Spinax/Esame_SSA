clc;clear;
% Definisco i blocchi che compongono il sistema partendo dalla loro
% funzione di trasferimento
sist1_tf = tf([1],[1 0 100]);
blockTF1 = ss(sist1_tf);
sist2_tf = tf([1],[1 0]);
blockTF2 = ss(sist2_tf);
gain_tf = tf([4]);
blockGain = ss(gain_tf);
%Definisco i nomi degli ingressi e delle uscite
%blockTF1.u = 'u1';
%blockTF1.y = 'y1';
%blockTF2.u = 'u2';
%blockTF2.y = 'y2';
%blockGain.u = 'u1';
%blockGain.y = 'yGain';                                 %CANCELLARE
%Definisco le interconnessioni tra i blocchi
blockPlusGainSys = parallel(blockTF1, blockGain);
sysWithoutFB = series(blockPlusGainSys, blockTF2);
CompleteSystem = feedback(sysWithoutFB, 1);
%sum1 = sumblk('u2 = y1 + yGain');
%sum2 = sumblk('u1 = u - y2');
%Connessione generale
%Sys1 = connect(blockTF1,blockTF2,sum2,  'u1' , 'y2');  %CANCELLARE
%Stampo la funzione di trasferimento
tf(CompleteSystem)
%Stampo le matrici che compongono l'equazione di stato
CompleteSystem






