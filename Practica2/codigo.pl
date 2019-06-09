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
%2
menor_o_igual(A,_):-
    var(A).

menor_o_igual(_,A):-
    var(A).

comp_name(AF,BF):-
   \+ AF @< BF,
   \+ BF @< AF.

menor_o_igual(A,B):-
    functor(A,AF,AA),
    functor(B,BF,BA),
    comp_name(AF,BF).


%3
ordenar(Lista,Comp,Orden).

lista_hojas(Lista,Hojas).

hojas_arbol(Hojas, COmp, Arbol).

ordenacion(Arbol,Comp,Orden).

ordenar(Lista,Comp,Orden).