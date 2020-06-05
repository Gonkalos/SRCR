%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Programacao em logica estendida
% Representacao de conhecimento imperfeito

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Definicoes iniciais

:- op( 900,xfy,'::' ).
:- dynamic '-'/1.
:- dynamic pai/2.
:- dynamic mae/2.
:- dynamic data_nascimento/4.
:- dynamic falecido/1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Aplicação do PMF

-pai(Pai,Filho) :- 
    nao(pai(Pai,Filho)), 
    nao(excecao(pai(Pai,Filho))).

-mae(Mae,Filho) :- 
    nao(mae(Mae,Filho)), 
    nao(excecao(mae(Mae,Filho))).

-data_nascimento(Pessoa,Dia,Mes,Ano) :- 
    nao(data_nascimento(Pessoa,Dia,Mes,Ano)), 
    nao(excecao(data_nascimento(Pessoa,Dia,Mes,Ano))).

%--------------------------------- - - - - - - - - - -  -  -  -  -   - i

pai(abel,ana).
mae(alice,ana).
data_nascimento(ana,1,1,2010).

%--------------------------------- - - - - - - - - - -  -  -  -  -   - ii

pai(antonio,anibal).
mae(alberta,anibal).
data_nascimento(anibal,2,1,2010).

%--------------------------------- - - - - - - - - - -  -  -  -  -   - iii

pai(bras,berta).
pai(bras,berto).
mae(belem,berta).
mar(belem,berto).
data_nascimento(berta,2,2,2010).
data_nascimento(berto,2,2,2010).

%--------------------------------- - - - - - - - - - -  -  -  -  -   - iv

data_nascimento(catia,3,3,2010).

%--------------------------------- - - - - - - - - - -  -  -  -  -   - v

mae(catia,crispim).
excecao(pai(P,crispim)) :- pertence(P,[celso,caio]).

%--------------------------------- - - - - - - - - - -  -  -  -  -   - vi

pai(daniel,danilo).
data_nascimento(danilo,4,4,2010).
mae(x1,danilo).
excecao(mae(M,F)) :- mae(x1,F).

%--------------------------------- - - - - - - - - - -  -  -  -  -   - vii

pai(elias,eurico).
mae(elsa,eurico).
excecao(data_nascimento(eurico,D,5,2010)) :- pertence(D,[5,15,25]).

%--------------------------------- - - - - - - - - - -  -  -  -  -   - viii

excecao(pai(fausto,F)) :- pertence(F,[fabia,octavia]).
mae(x2,fabia).
excecao(mae(M,F)) :- mae(x2,F).
mae(x3,octavia).
excecao(mae(M,F)) :- mae(x3,F).

%--------------------------------- - - - - - - - - - -  -  -  -  -   - ix

pai(guido,golias).
mae(guida,golias).
falecido(guido).
falecido(guida).

data_nascimento(golias,x4,x5,x6).
excecao(data_nascimento(P,D,M,A)) :- data_nascimento(P,x4,x5,x6).
nulo(x4,x5,x6).
+data_nascimento(P,D,M,A) :: ( solucoes( (D,M,A), (data_nascimento(golias,D,M,A), nao(nulo(D,M,A))),S ),
                               comprimento(S,N),
                               N == 0 ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   - x

nao(data_nascimento(helder,8,8,2010)).
excecao(data_nascimento(helder,D,M,A)) :- nao(pertence(D,[8])), nao(pertence(M,[8])), nao(pertence(A,[2010])).

%--------------------------------- - - - - - - - - - -  -  -  -  -   - xi

excecao(data_nascimento(ivo,D,6,2010)) :- D >= 1, D =< 15.
nao(data_nascimento(ivo,D,M,A)) :- D =< 31, D > 15, nao(pertence(M,[6])), nao(pertence(A,[2010])).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensão do predicado que permite a evolucao do conhecimento

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
% Extensão do meta-predicado nao: Questao -> {V,F}

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