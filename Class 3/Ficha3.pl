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
% Extensao do predicado pertence: Conjunto,Elem,R -> {V,F}

pertence([],_,'false').
pertence([H|T],H,'true'). 
pertence([H|T],Elem,R) :- pertence(T,Elem,R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado comprimento: Conjunto,R -> {V,F}

comprimento([],0).
comprimento([H|T],R) :- comprimento(T,Rest), R is Rest + 1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado diferentes: Conjunto,R -> {V,F}

diferentes([],0).
diferentes([H|T],R) :- pertence(T,H,'true') -> diferentes(T,R).
diferentes([H|T],R) :- pertence(T,H,'false') -> diferentes(T,Rest), R is Rest + 1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado apaga1: Elemento,Conjunto,R -> {V,F}

apaga1(X,[X|T],T).
apaga1(X,[H|T],[H|L]) :- H \= X -> apaga1(X,T,L).