:- use_module(library(lists)).
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

add(X, 0, X).
add(X, succ(Y), succ(Z)) :-
    add(X, Y, Z).

eq(0, 0).					
eq(s(A), s(B)) :-
    eq(A, B).		
	                             
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

sum(0, A, A).				
sum(s(A), B, s(C)) :-
    sum(A, B, C).

%Primera Parte

%pieza(Ancho, Alto, Prof, Color).
ancho(pieza(Ancho, _, _, _), Ancho).
alto(pieza(_, Alto, _, _), Alto).
prof(pieza(_, _, Prof, _), Prof).
color(pieza(_, _, _, Color), Color).

pieza(nat(N), nat(N), nat(N), Colour) :-
    nat_geq(N, 0),
    member(Colour, [am, r, a, v]).

piezaTorre(nat(N), _, nat(N), Colour) :-
    nat_geq(N, 0),
    member(Colour, [am, r, a, v]).

%esTorre(Construccion).


%esTorre(pieza(s(0),s(0),s(0),_)).
esTorre([X, Xs]) :-
    ancho(X, Value1),
    ancho(Xs, Value2),
    prof(X, Value3),
    prof(Xs, Value4),
    nat_leq(Value1, Value2),
    nat_leq(Value3, Value4).

esTorre([X, Xs|Y]) :-
    ancho(X, Value1),
    ancho(Xs, Value2),
    prof(X, Value3),
    prof(Xs, Value4),
    nat_leq(Value1, Value2),
    nat_leq(Value3, Value4),
    esTorre([Xs|Y]).


%alturaTorre(Construccion,A).
alturaTorre([], 0).
alturaTorre([X|Xs], N) :-
    alturaTorre(Xs, B),
    alto(X, Value),
    sum(Value, B, N).
    


%coloresTorre(Construccion,Colores).
coloresTorre([], []).
coloresTorre([X|Xs], N) :-
    coloresTorre(Xs, B),
    color(X, Value1),
    append(B, [Value1], N).


%coloresIncluidos(Construccion1,Construccion2).

%Segunda Parte

%esEdificioPar(Construccion).

%esEdificioPiramide(Construccion).
