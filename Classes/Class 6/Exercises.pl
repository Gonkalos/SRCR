%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Programacao em logica estendida

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).




:- dynamic '-'/1.
:- dynamic mamifero/1.
:- dynamic morcego/1.


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado nao: Questao -> {V,F}

nao( Questao ) :-
    Questao, !, fail.
nao( Questao ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado demo: Questao,Resposta -> {V,F}
%                            Resposta = { verdadeiro,falso,desconhecido }

demo( Questao,verdadeiro ) :-
    Questao.
demo( Questao,falso ) :-
    -Questao.
demo( Questao,desconhecido ) :-
    nao( Questao ),
    nao( -Questao ).
	
%--------------------------------- - - - - - - - - - questão i


voa( X ) :-
    ave( X ),nao( excecao( voa( X ) ) ).
	
voa( X ) :-
    excecao( -voa( X ) ).

%--------------------------------- - - - - - - - - - -  questão ii


-voa( X ) :-
    mamifero( X ),nao( excecao( -voa( X ) ) ).  % o morcego voa....
	
	
-voa( X ) :-
    excecao( voa( X ) ).


excecao(voa(X)) :- avestruz(X).

excecao(voa(X)) :- pinguim(X).

excecao(-voa(X)) :- morcego(X). 


%--------------------------------- - - - - - - - - - -  questão iii


-voa(Tweety).


%--------------------------------- - - - - - - - - - -  questão iv


ave(Pitigui).


%--------------------------------- - - - - - - - - - -  questão v


ave(X) :- canario(X).


%--------------------------------- - - - - - - - - - -  questão vi


ave(X) :- periquito(X).


%--------------------------------- - - - - - - - - - -  questão vii


canario(Piupiu).


%--------------------------------- - - - - - - - - - -  questão viii


mamifero(Silvestre).


%--------------------------------- - - - - - - - - - -  questão ix


mamifero(X) :- cao(X).


%--------------------------------- - - - - - - - - - -  questão x


mamifero(X) :- gato(X).


%--------------------------------- - - - - - - - - - -  questão xi


cao(Boby).


%--------------------------------- - - - - - - - - - -  questão xii


ave(X) :- avestruz(X).


%--------------------------------- - - - - - - - - - -  questão xiii


ave(X) :- pinguim(X).


%--------------------------------- - - - - - - - - - -  questão xiv


avestruz(Truz).


%--------------------------------- - - - - - - - - - -  questão xv


pinguim(Pingu).


%--------------------------------- - - - - - - - - - -  questão xvi


mamifero(X) :- morcego(X).


%--------------------------------- - - - - - - - - - -  questão xvii


morcego(Batemene).