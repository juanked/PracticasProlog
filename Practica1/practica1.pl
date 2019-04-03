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

eq(0, 0).
eq(s(A), s(B)) :-
    eq(A, B).

grt_eq(_N, zero).					% Every natural number is larger than 0
grt_eq(s(N), s(M)):-				% a > b => (a + 1) > (b + 1)
	grt_eq(N, M).

grt(_N, 0).					    % Every natural number is larger than 0
grt(s(N), s(M)):-				% a > b => (a + 1) > (b + 1)
	grt(N, M), N \= M.

lst_eq(0, _).					    % 0 is the smallest natural number
lst_eq(s(N), s(M)):-				% a < b => (a + 1) < (b + 1)
	lst_eq(N, M).

lst(0, _).					    % 0 is the smallest natural number
lst(s(N), s(M)):-				% a < b => (a + 1) < (b + 1)
	lst(N, M), N \= M.

sum(0, A, A).
sum(s(A), B, s(C)) :-
    sum(A, B, C).

my_member(X, [X|_]).
my_member(X, [_|Ys]) :-
    my_member(X, Ys).

appendeamos([], L, L).
appendeamos([H|T], L2, [H|L3]) :-
    appendeamos(T, L2, L3).

memberlistas([], _).
memberlistas([X|Xs], Y) :-
    my_member(X, Y),
    memberlistas(Xs, Y).

%Primera Parte

%pieza(Ancho, Alto, Prof, Color).
ancho(pieza(Ancho, _, _, _), Ancho).
alto(pieza(_, Alto, _, _), Alto).
prof(pieza(_, _, Prof, _), Prof).
color(pieza(_, _, _, Color), Color).

peano_par(0).
peano_par(s(s(X))) :-
    peano_par(X).

pieza(nat(N), nat(N), nat(N), Colour) :-
    grt_eq(N, 0),
    member(Colour, [am, r, a, v]).

esPieza(X):-
    ancho(X, Value1),
    grt(Value1,0),
    alto(X,Value2),
    grt(Value2,0),
    prof(X, Value3),
    grt(Value3,0).
    

%esTorre(Construccion).


%esTorre(pieza(s(0),s(0),s(0),_)).
esTorre([X]):-
    esPieza(X).

esTorre([X, Xs]) :-
    esPieza(X),
    ancho(X, Value1),
    ancho(Xs, Value2),
    prof(X, Value3),
    prof(Xs, Value4),
    lst_eq(Value1, Value2),
    lst_eq(Value3, Value4).

esTorre([X, Xs|Y]) :-
    esPieza(X),
    ancho(X, Value1),
    ancho(Xs, Value2),
    prof(X, Value3),
    prof(Xs, Value4),
    lst_eq(Value1, Value2),
    lst_eq(Value3, Value4),
    esTorre([Xs|Y]).


%alturaTorre(Construccion,A).
alturaTorre([X|Xs], N) :-
    esTorre([X|Xs]),
    altura([X|Xs], N).

altura([], 0).
altura([X|Xs], N) :-
    altura(Xs, B),
    alto(X, Value),
    sum(Value, B, N).



%coloresTorre(Construccion,Colores).
coloresTorre([X|Xs], N) :-
    esTorre([X|Xs]),
    colores([X|Xs], N).

colores([], []).
colores([X|Xs], N) :-
    colores(Xs, B),
    color(X, Value1),
    appendeamos([Value1], B, N).



%coloresIncluidos(Construccion1,Construccion2).
coloresIncluidos([X|Xs], [Y|Ys]) :-
    esTorre([X|Xs]),
    esTorre([Y|Ys]),
    coloresInc([X|Xs], [Y|Ys]).

coloresInc([X|Xs], [Y|Ys]) :-
    colores([X|Xs], N),
    colores([Y|Ys], M),
    memberlistas(N, M).


%Segunda Parte

%esEdificioPar(Construccion).
esEdificioPar([X]):-
    esNivelPar(X).
esEdificioPar([X|Xs]):-
    esNivelPar(X),
    esEdificioPar(Xs).

esNivelPar(X):-
    anchoEdificio(X,N),
    peano_par(N).


%esEdificioPiramide(Construccion).
esEdificioPiramide([_]).

esEdificioPiramide([X, Xs]) :-
    anchoEdificio(X, N),
    anchoEdificio(Xs, M),
    lst(N, M).
esEdificioPiramide([X, Xs|Y]) :-
    anchoEdificio(X, N),
    anchoEdificio(Xs, M),
    lst(N, M),
    esEdificioPiramide([Xs|Y]).

%metodo auxiliar para calcular el ancho de cada nivel
anchoEdificio([], 0).
anchoEdificio([X|Xs], N) :-
    anchoEdificio(Xs, B),
    clavo(X, C),
    sum(C, B, N).

%metodo auxiliar para determinar si hay un clavo o una b
clavo(b, 0).
clavo(X, s(0)) :-  X \= b.
