%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Base de Conhecimento com informacao genealogica.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado par: Numero -> {V,F}

par(X) :- 0 is mod(X,2).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado impar: Numero -> {V,F}

impar(X) :- 1 is mod(X,2).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado natural: Numero,R -> {V,F}

natural(0,'true').
natural(N,R) :- integer(N), N > 0.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado natural: Numero -> {V,F}

inteiro(Z) :- integer(Z).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado divisores: Numero,Lista de Divisores -> {V,F}

divisores(X,L) :- divisores(X,1,L).
divisores(X,Y,[Y|L]) :- 0 =:= mod(X,Y), Y =< X // 2, Y1 is Y + 1, divisores(X,Y1,L).
divisores(X,Y,L) :- 0 =\= mod(X,Y), Y =< X // 2, Y1 is Y + 1, divisores(X,Y,L).
divisores(X,Y,L) :- Y > X // 2.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado primo: Numero,R -> {V,F}

primo(1,'true').
primo(X) :- divisores(X,L), length(L,2).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado mdc: Numero,Numero,R -> {V,F}

mdc(X,Y,R) :- X > Y, X1 is X-Y, mdc(X1,Y,R).
mdc(X,Y,R) :- Y > X, Y1 is Y-X, mdc(X,Y1,R).
mdc(X,X,X).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado mmc: Numero,Numero,R -> {V,F}

mmc(X,X,X).
mmc(X,Y,R) :- mmc(X,X,0,Y,Y,0,R).

mmc(X,_,_,X,_,_,X).

mmc(X,A,0,Y,B,0,R) :- X > Y, mmc(X,A,0,Y,B,1,R).
mmc(X,A,0,Y,B,0,R) :- X < Y, mmc(X,A,1,Y,B,0,R).

mmc(X,A,0,Y,B,1,R) :- Y1 is Y + B, mmc(X,A,0,Y1,B,0,R).
mmc(X,A,1,Y,B,0,R) :- X1 is X + A, mmc(X1,A,0,Y,B,0,R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado fibonacci: Indice,R -> {V,F}

fibonacci(0,0).
fibonacci(1,1).
fibonacci(X,R) :- X1 is X - 1, X2 is X - 2, fibonacci(X1,R1), fibonacci(X2,R2), R is R1 + R2. 