%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariantes

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: definicoes iniciais

:- op( 900,xfy,'::' ).
:- dynamic filho/2.
:- dynamic pai/2.
:- dynamic neto/2.
:- dynamic avo/2.
:- dynamic descendente/3.
:- dynamic idade/2.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado filho: Filho,Pai -> {V,F}

filho( joao,jose ).
filho( jose,manuel ).
filho( carlos,jose ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado pai: Pai,Filho -> {V,F}

pai(P,F) :- filho(F,P).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado neto: Neto,Avo -> {V,F}

neto(N,A) :- filho(N,P), filho(P,A).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado avo: Avo,Neto -> {V,F}

avo(A,N) :- pai(A,P), pai(P,N).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado descendente: Descendente,Ascendente,Grau -> {V,F}

descendente(D,A,1) :- filho(D,A).
descendente(D,A,G) :- G1 is G - 1, filho(D,P), descendente(P,A,G1).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado idade: Pessoa,Idade -> {V,F}

idade( joao,21 ).
idade( jose,42 ).
idade( manuel,63 ).
idade( carlos,19 ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariante Estrutural: nao permitir a insercao de conhecimento repetido

+filho( F,P ) :: (solucoes( (F,P),(filho( F,P )),S ),
                  comprimento( S,N ), 
				  N == 1  ).

% Invariante Referencial: nao admitir mais do que 2 progenitores para um mesmo individuo

+filho( F,P ) :: (solucoes( (Ps),(filho( F,Ps )),S ),
                  comprimento( S,N ), 
                  N =< 2  ).

% Invariante Referencial: nao e possivel remover filhos para os quais exista registo de idade

-filho( F,P ) :: (solucoes( (F),( idade( F,I ) ),S ),
                  comprimento( S,N ), 
                  N == 0  ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariante Estrutural: nao permitir a insercao de conhecimento repetido

+pai( P,F ) :: (solucoes( (P,F),(pai( P,F )),S ),
                  comprimento( S,N ), 
				  N == 1  ).

% Invariante Referencial: nao admitir mais do que 2 progenitores para um mesmo individuo

+pai( P,F ) :: (solucoes( (Ps),(pai( Ps,F )),S ),
                comprimento( S,N ), 
                N =< 2  ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariante Estrutural: nao permitir a insercao de conhecimento repetido

+neto( F,A ) :: (solucoes( (F,A),(neto( F,A )),S ),
                 comprimento( S,N ), 
				 N == 1  ).

% Invariante Referencial: nao admitir mais do que 4 indivíduos identificados como avo

+neto( F,A ) :: (solucoes( (As),(neto( F,As )),S ),
                 comprimento( S,N ), 
                 N =< 4  ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariante Estrutural: nao permitir a insercao de conhecimento repetido

+avo( A,F ) :: (solucoes( (A,F),(avo( A,F )),S ),
                  comprimento( S,N ), 
				  N == 1  ).

% Invariante Referencial: nao admitir mais do que 4 indivíduos identificados como avo

+avo( A,F ) :: (solucoes( (As),(avo( As,F )),S ),
                 comprimento( S,N ), 
                 N =< 4  ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariante Estrutural: nao permitir a insercao de conhecimento repetido

+descendente( D,A,G ) :: (solucoes( (D,A,G),(descendente( D,A,G )),S ),
                          comprimento( S,N ), 
				          N == 1  ).

% Invariante Referencial: a identificação do grau de descendência deverá pertencer ao conjunto dos números naturais N

+descendente( D,A,G ) :: (solucoes( (G),(descendente( D,A,G )),S ),
                          integer(G) ).

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
% Extensao do predicado que permite a involucao do conhecimento

involucao( Termo ) :-
    solucoes( Invariante,-Termo::Invariante,Lista ),
    remocao( Termo ),
    teste( Lista ).

remocao( Termo ) :-
    retract( Termo ).
remocao( Termo ) :-
    assert( Termo ),!,fail.

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