:- use_module(library(lists)).
%Nuestros datos
%alumno_prode(Alvarez,Benavente,Alejandro,y160319).
%alumno_prode(Pascual,Cristobal,Alejandro,y160336).
%alumno_prode(Aparicio,Doncel,Alberto,y160364).
%-------------------------------------------

% practica1.pl

% Números de Peano
nat(0).
nat(s(N)):-nat(s(N)).

%Primera Parte

esTorre(Construccion).

alturaTorre(Construccion,A).

coloresTorre(Construccion,Colores).

coloresIncluidos(Construccion1,Construccion2).

%Segunda Parte

esEdificioPar(Construccion).

esEdificioPiramide(Construccion).