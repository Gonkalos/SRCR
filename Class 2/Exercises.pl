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
% Extensao do predicado soma: Num,Num,R -> {V,F}

soma(X,Y,R) :- R is X + Y.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado soma: Num,Num,Num,R -> {V,F}

soma(X,Y,Z,R) :- R is X + Y + Z.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado soma: Conjunto,R -> {V,F}

soma([],0).
soma([H|T],R) :- soma(T,Rest), R is Rest + H. 

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado operacao: Num,Num,Operacao,R -> {V,F}

operacao(X,Y,'+',R) :- R is X + Y.
operacao(X,Y,'-',R) :- R is X - Y.
operacao(X,Y,'*',R) :- R is X * Y.
operacao(X,Y,'/',R) :- R is X / Y.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado operacao: Conjunto,Operacao,R -> {V,F}

operacao2([],_,0).
operacao2([H|[]],_,H).
operacao2([X,Y|T],Operacao,R) :- operacao2(T,Operacao,Rest), R is Rest + operacao(X,Y,Operacao,Rest). 