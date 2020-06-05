%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Programacao em logica 
% Grafos (Ficha 9)

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: definicoes iniciais

:- op( 900,xfy,'::' ).
:- dynamic '-'/1.
:- dynamic adjacente/3.
:- dynamic caminho/4.
:- dynamic ciclo/3.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -

g(grafo([a,b,c,d,e,f,g], [aresta(a,b),aresta(c,d),aresta(c,f),aresta(d,f),aresta(f,g)])).	

g1(grafo([a,b,c,d,e,f,g], [aresta(a,b),aresta(c,d),aresta(c,f),aresta(d,f),aresta(f,g), aresta(f,e), aresta(e,d)])).

%--------------------------------- - - - - - - - - - -  -  -  -  -   - 
% Extensao do predicado adjacente: Nodo,Nodo,Grafo -> {V,F}

-adjacente(Nodo1,Nodo2,Grafo) :- 
    nao(adjacente(Nodo1,Nodo2,Grafo)), 
    nao(excecao(adjacente(Nodo1,Nodo2,Grafo))).

%--------------------------------- - - - - - - - - - -  -  -  -  -   - 

adjacente(X,Y,grafo(_,Es)) :- member(aresta(X,Y),Es).
adjacente(X,Y,grafo(_,Es)) :- member(aresta(Y,X),Es).

%--------------------------------- - - - - - - - - - -  -  -  -  -   - 
% Extensao do predicado caminho: Grafo,Nodo,Nodo,Caminho -> {V,F}

caminho(G,A,B,P) :- caminho1(G,A,[B],P).

caminho1(_,A,[A|P1],[A|P1]).
caminho1(G,A,[Y|P1],P) :- adjacente(X,Y,G),             % encontar X adjacente de Y
                          \+ pertence(X,[Y|P1]),        % o X ainda não está na lista de visitados
                          caminho1(G,A,[X,Y|P1],P).     % adicionar o X no início da lista

%--------------------------------- - - - - - - - - - -  -  -  -  -   - 
% Extensao do predicado ciclo: Grafo,Nodo,Ciclo -> {V,F}

ciclo(G,A,P) :- adjacente(B,A,G),       % encontrar B adjacente de A
                caminho(G,A,B,P1),      % existe caminho entre B e A
                length(P1,L), L > 2,    % o caminho não é [A,A]
                append(P1,[A],P).       % adicionar o A no fim do P1 e por o resultado no P

%--------------------------------- - - - - - - - - - -  -  -  -  -   - 
% Extensão do predicado que permite a evolucao do conhecimento

evolucao( Termo ) :-
    solucoes( Invariante,+Termo::Invariante,Lista ),
    insercao( Termo ),
    teste( Lista ).

insercao( Termo ) :-
    assert( Termo ).
insercao( Termo ) :-
    retract( Termo ),!,fail.

teste( [] ).
teste( [R|LR] ) :-
    R,
    teste( LR ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensão do predicado que permite a involucao do conhecimento

involucao( Termo ) :-
    solucoes( Invariante,-Termo::Invariante,Lista ),
    remocao( Termo ),
    teste( Lista ).

remocao( Termo ) :-
    retract( Termo ).
remocao( Termo ) :-
    assert( Termo ),!,fail.

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

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado nao: Questao -> {V,F}

nao( Questao ) :-
    Questao, !, fail.
nao( Questao ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -

solucoes( X,Y,Z ) :-
    findall( X,Y,Z ).

comprimento( S,N ) :-
    length( S,N ).

pertence( X,[X|L] ).
pertence( X,[Y|L] ) :-
    X \= Y,
    pertence( X,L ).