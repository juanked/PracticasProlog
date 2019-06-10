%Nuestros datos
alumno_prode(Benavente,Alvarez,Alejandro,160319).
alumno_prode(Cristobal,Pascual,David,160336).
alumno_prode(Doncel,Aparicio,Alberto,160364).   %PORTAVOZ
%----------------------------------

%1

% menor/4(num1, num2, Comp, Solucion) devuelve en M el menor entre A y B siguiendo Comp
menor(A,B,Comp,M):-
    number(A),          % Comprueba si A es un numero
    number(B),          % Comprueba si B es un numero
    X=..[Comp,A,B],     % Crea una función con Comp entre A y B
    call(X),            % X es Goal
    M is A.             % Guarda A en M si A es el menor

% menor/4 devuelve en M el menor entre A y B siguiendo Comp
menor(A,B,Comp,M):-
    number(A),
    number(B),
    X=..[Comp,B,A],
    call(X),
    M is B.             % Guarda B en M si B es el menor

%2.

% comp_rec/2(Lista1, Lista2)
% true si cada elemento de la Lista1 es <= que el mismo elemento de la Lista2
comp_rec([],[]).
comp_rec([X|Xs],[Y|Ys]):-
    menor_o_igual(X,Y),
    comp_rec(Xs,Ys).

% menor_o_igual(Elemento1, Elemento2)
% true si Elemento1 <= Elemento2 asi:
%   variable libre es igual a otro termino
%   un termino es menor que otro (ninguno variable libre)
%   si su nombre es @< que el otro
%   nombres identicos y aridad menor
%   si nombre y aridad iguales se comparan de izquierda a derecha los terminos
menor_o_igual(A,_):-
    var(A).             % comprueba que E1 es una variable

menor_o_igual(_,A):-
    var(A).             % comprueba que E2 es una variable

menor_o_igual(A,B):-
    functor(A,AF,_),
    functor(B,BF,_),
    AF @< BF.           % comprueba si un el nombre de E1 es @< que el de E2

menor_o_igual(A,B):-
    functor(A,_,AA),
    functor(B,_,BA),
    AA < BA.            % comprueba si la aridad de E1 es menor que la de E2

menor_o_igual(A,B):-
    functor(A,AF,AA),
    functor(B,BF,BA),
    AF == BF,           % comprueba que los nombres de E1 y E2 sean iguales
    AA == BA,           % comprueba que las aridades de E1 y E2 sean iguales
    A=..[_|X],          % se quita la funcion para obtener el resto de elementos de E1
    B=..[_|Y],          % se quita la funcion para obtener el resto de elementos de E2
    comp_rec(X,Y).      % compara los elementos con comp_rec/2.

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

%ordenacion([A],Comp,Orden).

ordenacion(Arbol,Comp,Orden).

