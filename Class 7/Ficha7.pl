%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Programacao em logica estendida

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Definicoes iniciais

:- op( 900,xfy,'::' ).
:- dynamic '-'/1.
:- dynamic jogo/3.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado jogo: Jogo,Arbitro,Ajudas -> {V,F,D}

-jogo(Jogo,Arbitro,Ajudas) :- 
    nao(jogo(Jogo,Arbitro,Ajudas)), 
    nao(excecao(jogo(Jogo,Arbitro,Ajudas))).

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


jogo(1,aa,500).


%--------------------------------- - - - - - - - - - -  questão ii


jogo(2,bb,xpto1).

excecao(jogo(Jogo,Arbitro,Ajudas)) :- jogo(Jogo,Arbitro,xpto1).


%--------------------------------- - - - - - - - - - -  questão iii


excecao(jogo(3,cc,500)).

excecao(jogo(3,cc,2500)).


%--------------------------------- - - - - - - - - - -  questão iv


excecao(jogo(4,dd,Ajudas)) :- Ajudas >= 250, Ajudas =< 750.


%--------------------------------- - - - - - - - - - -  questão v


jogo(5,ee,xpto2).
excecao(jogo(Jogo,Arbitro,Ajudas)) :- jogo(Jogo,Arbitro,xpto2).

nulo(xpto2).

+jogo(J,A,C) :: (solucoes( Ajudas, 
                           (jogo(5,ee,Ajudas), 
                           nao(nulo(Ajudas))),
                           S ),
                 comprimento( S,N ),
                 N == 0).


%--------------------------------- - - - - - - - - - -  questão vi


jogo(6,ff,250).

excecao(jogo(6,ff,Ajudas)) :- Ajudas >= 5000.


%--------------------------------- - - - - - - - - - -  questão vii


-jogo(7,gg,2500).

jogo(7,gg,xpto3).

excecao(jogo(Jogo,Arbitro,Ajudas)) :- jogo(Jogo,Arbitro,xpto3).


%--------------------------------- - - - - - - - - - -  questão viii


excecao(jogo(8,hh,Ajudas)) :- cerca(1000,Sup,Inf), Ajudas >= Inf, Ajudas =< Sup.

cerca(X,Sup,Inf) :- Sup is X * 1.25, Inf is X * 0.75.


%--------------------------------- - - - - - - - - - -  questão ix


excecao(jogo(9,ii,Ajudas)) :- mproximo(3000,Sup,Inf), Ajudas >= Inf, Ajudas =< Sup.

mproximo(X,Sup,Inf) :- Sup is X * 1.1, Inf is X * 0.9.


%--------------------------------- - - - - - - - - - -  questão x


% Invariante Estrutural: não permitir a inserção de conhecimento repetido

+jogo(J,A,C) :: ( solucoes( J,
                           (jogo(J,Arbitro,Custo)),
                           S ),
                  comprimento(S,N),
                  N == 1 ).


%--------------------------------- - - - - - - - - - -  questão xi


% Invariante Referencial: um árbitro não pode apitar mais do que 3 partidas do campeonato

+jogo(J,A,C) :: ( solucoes( A,
                            (jogo(Jogo,A,Custo)),
                            S ),
                  comprimento(S,N),
                  N =< 3 ).


%--------------------------------- - - - - - - - - - -  questão xii


% Invariante Referencial: o mesmo árbitro não pode apitar duas partidas consecutivas.

+jogo(J,A,C) :: ( solucoes( (J1,J2),
                            (jogo(J1,A,C1), J2 is J1 + 1, jogo(J2,A,C2)),
                            S ),
                  comprimento(S,N),
                  N == 0 ).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -


% Extensao do predicado que permite a evolucao do conhecimento

evolucao( Termo ) :-
    solucoes( Invariante,+Termo::Invariante,Lista ),
    insercao( Termo ),
    teste( Lista ).

insercao( Termo ) :-
    assert( Termo ).
insercao( Termo ) :-
    retract( Termo ), !,fail.
	
teste( [] ).
teste( [R|LR] ) :-
    R,
    teste( LR ).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -


solucoes( X,Y,Z ) :-
    findall( X,Y,Z ).

comprimento( S,N ) :-
    length( S,N ).