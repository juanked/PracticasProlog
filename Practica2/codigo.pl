%Nuestros datos
alumno_prode(Benavente,Alvarez,Alejandro,160319).
alumno_prode(Cristobal,Pascual,David,160336).
alumno_prode(Doncel,Aparicio,Alberto,160364).   %PORTAVOZ
%----------------------------------
%1
menor(A,B,Comp,M):-
    number(A),
    number(B),
    X=..[Comp,A,B],
    call(X),
    M is A.

menor(A,B,Comp,M):-
    number(A),
    number(B),
    X=..[Comp,B,A],
    call(X),
    M is B.
%2.

comp_rec([],[]).

comp_rec([X|Xs],[Y|Ys]):-
    menor_o_igual(X,Y),
    comp_rec(Xs,Ys).
    
menor_o_igual(A,_):-
    var(A).

menor_o_igual(_,A):-
    var(A).

menor_o_igual(A,B):-
    functor(A,AF,_),
    functor(B,BF,_),
    AF @< BF.

menor_o_igual(A,B):-
    functor(A,_,AA),
    functor(B,_,BA),
    AA < BA.

menor_o_igual(A,B):-
    functor(A,AF,AA),
    functor(B,BF,BA),
    AF == BF,
    AA == BA,
    A=..[_|X],
    B=..[_|Y],
    comp_rec(X,Y).

%3
ordenar(Lista,Comp,Orden).

lista_hojas([],[]).
lista_hojas([A],Hojas):-
    Hojas=[tree(A,void,void)].
lista_hojas(Lista,Hojas):-
    Lista=[X|Lista2],
    Hojas=[tree(X,void,void)|Hojas2],
    lista_hojas(Lista2,Hojas2).
    
hojas_arbol(Hojas, Comp, Arbol).

ordenacion(Arbol,Comp,Orden).