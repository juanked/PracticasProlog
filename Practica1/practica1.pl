%:- use_module(library(lists)).
%Nuestros datos
%alumno_prode(Alvarez,Benavente,Alejandro,y160319).
%alumno_prode(Pascual,Cristobal,Alejandro,y160336).
%alumno_prode(Aparicio,Doncel,Alberto,y160364).
%-------------------------------------------

% practica1.pl

% Números de Peano
nat(0).
nat(s(N)) :-
    nat(s(N)).

nat_geq(0, 0).
nat_geq(N, 0) :-
    nat(N),
    N\=0.
nat_geq(s(N), s(M)) :-
    nat_geq(N, M).

nat_leq(0, 0).
nat_leq(0, N) :-
    nat(N),
    N\=0.
nat_leq(s(N), s(M)) :-
    nat_leq(N, M).

nat_lt(0, N) :-
    nat(N),
    N\=0.
nat_lt(s(N), s(M)) :-
    nat_lt(N, M).

nat_gt(N, 0) :-
    nat(N),
    N\=0.
nat_gt(s(N), s(M)) :-
    nat_gt(N, M).

%Primera Parte

%pieza(Ancho, Alto, Prof, Color).
pieza(nat(N), nat(N), nat(N), Colour) :-
    nat_geq(N, 0),
    member(Colour, [am, r, a, v]).

piezaTorre(nat(N), _, nat(N), Colour) :-
    nat_geq(N, 0),
    member(Colour, [am, r, a, v]).
    





%esTorre(Construccion).

%esTorre(pieza(s(0),s(0),s(0),_)).
esTorre([X, Xs]) :-
    arg(1, X, Value1),
    arg(1, Xs, Value2),
    arg(3, X, Value3),
    arg(3, Xs, Value4),
    nat_leq(Value1, Value2),
    nat_leq(Value3, Value4).

esTorre([X, Xs|Y]) :-
    arg(1, X, Value1),
    arg(1, Xs, Value2),
    arg(3, X, Value3),
    arg(3, Xs, Value4),
    nat_leq(Value1, Value2),
    nat_leq(Value3, Value4),
    esTorre([Xs|Y]).




%alturaTorre(Construccion,A).

%coloresTorre(Construccion,Colores).

%coloresIncluidos(Construccion1,Construccion2).

%Segunda Parte

%esEdificioPar(Construccion).

%esEdificioPiramide(Construccion).