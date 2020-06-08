
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %
% ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
%|                                                      Trabalho Prático Individual 2                                                      |%
%|                                                             Gonçalo Almeida                                                             |%
%|                                                                  A84610                                                                 |%  
% ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %

% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %

% SICStus PROLOG: Definicoes iniciais

:- include(factos).
:- include(auxiliares).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %

% Calcular um trajeto entre dois pontos (pesquisa em profundidade primeiro multi-estados)

trajeto(Origem, Destino, Caminho) :- profundidade(Origem, Destino, [Origem], Caminho),
                                     write('Trajeto: '),
                                     escrever(Caminho).

profundidade(Destino, Destino, Visitados, Caminho) :- inverso(Visitados, Caminho).

profundidade(Origem, Destino, Visitados, Caminho) :- adjacente_h(Origem, Prox),
										                                 \+ member(Prox, Visitados),
										                                 profundidade(Prox, Destino, [Prox|Visitados], Caminho).

adjacente_h(Paragem, Prox) :- adjacente(Paragem, Prox, _, _).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %

% Selecionar apenas algumas das operadoras de transporte para um determinado percurso (pesquisa em profundidade primeiro multi-estados)

com_operadoras(Origem, Destino, Operadoras, Caminho) :- paragem(Destino, _, _, _, _, _, Ope, _, _, _),
                                                        pertence(Ope, Operadoras),
                                                        profundidade2(Origem, Destino, Operadoras, [Origem], Caminho),
                                                        write('Trajeto: '),
                                                        escrever(Caminho).

profundidade2(Destino, Destino, Operadoras, Visitados, Caminho) :- inverso(Visitados, Caminho).

profundidade2(Origem, Destino, Operadoras, Visitados, Caminho) :- adjacente_h2(Origem, Prox, Operadoras),
										                                              \+ member(Prox, Visitados),
										                                              profundidade2(Prox, Destino, Operadoras, [Prox|Visitados], Caminho).

adjacente_h2(Paragem, Prox, Operadoras) :- paragem(Paragem, _, _, _, _, _, Ope, _, _, _),
                                           pertence(Ope, Operadoras),
                                           adjacente(Paragem, Prox, _, _).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %

% Excluir um ou mais operadores de transporte do percurso (pesquisa em profundidade primeiro multi-estados)

sem_operadoras(Origem, Destino, Operadoras, Caminho) :- paragem(Destino, _, _, _, _, _, Ope, _, _, _),
                                                        nao(pertence(Ope, Operadoras)),
                                                        profundidade3(Origem, Destino, Operadoras, [Origem], Caminho),
                                                        write('Trajeto: '),
                                                        escrever(Caminho).

profundidade3(Destino, Destino, Operadoras, Visitados, Caminho) :- inverso(Visitados, Caminho).

profundidade3(Origem, Destino, Operadoras, Visitados, Caminho) :- adjacente_h3(Origem, Prox, Operadoras),
										                                              \+ member(Prox, Visitados),
										                                              profundidade3(Prox, Destino, Operadoras, [Prox|Visitados], Caminho).

adjacente_h3(Paragem, Prox, Operadoras) :- paragem(Paragem, _, _, _, _, _, Ope, _, _, _),
                                           nao(pertence(Ope, Operadoras)),
                                           adjacente(Paragem, Prox, _, _).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %

% Identificar quais as paragens com o maior número de carreiras num determinado percurso (pesquisa em profundidade primeiro multi-estados)

mais_carreiras(Origem, Destino, Caminho) :- mais_carreiras(Origem, Destino, Caminho, Origem, 0).

mais_carreiras(Origem, Destino, Caminho, Gid, N) :- profundidade4(Origem, Destino, [Origem], Caminho, Gid, N),
                                                    write('Trajeto: '),
                                                    escrever(Caminho).

profundidade4(Destino, Destino, Visitados, Caminho, Gid, N) :- inverso(Visitados, Caminho),
                                                               write('Paragem: '), 
                                                               write(Gid),
                                                               write(' -> '), 
                                                               write(N),
                                                               write(' carreiras\n').

profundidade4(Origem, Destino, Visitados, Caminho, Gid, N) :- adjacente_h(Origem, Prox),
										                                          \+ member(Prox, Visitados),
                                                              carreiras(Origem, Lista),
                                                              length(Lista, N1),
                                                              N1 > N,
										                                          profundidade4(Prox, Destino, [Prox|Visitados], Caminho, Origem, N1).

profundidade4(Origem, Destino, Visitados, Caminho, Gid, N) :- adjacente_h(Origem, Prox),
										                                          \+ member(Prox, Visitados),
                                                              carreiras(Origem,Lista),
                                                              length(Lista,N1),
                                                              N1 =< N,
										                                          profundidade4(Prox, Destino, [Prox|Visitados], Caminho, Gid, N).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %

% Escolher o menor percurso usando critério menor número de paragens (pesquisa em profundidade primeiro multi-estados)

menos_paragens(Origem, Destino, R) :- findall( (Caminho,N), 
                                               ( profundidade(Origem, Destino, [Origem], Caminho), 
                                                 length(Caminho, N) ),
                                               S ),
                                      menor(S, R),
                                      write('Trajeto: '),
                                      escrever(R).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %

% Escolher o percurso mais rápido usando critério da distância (pesquisa a estrela) 

menor_distancia(Origem, Destino, Caminho/Distancia) :- estima(Origem, Destino, Estima),
									       	                             aestrela([[Origem]/0/Estima], InvCaminho/Distancia/_, Destino),
										                                   inverso(InvCaminho, Caminho),
                                                       write('Trajeto: '),
                                                       escrever(Caminho),
                                                       write('\n'),
                                                       write('Distancia: '),
                                                       write(Distancia).

aestrela(Caminhos, Caminho, Destino) :- obtem_melhor(Caminhos, Caminho),
	       					                      Caminho = [Destino|_]/_/_.

aestrela(Caminhos, SolucaoCaminho, Destino) :- obtem_melhor(Caminhos, MelhorCaminho),
	       							                         seleciona(MelhorCaminho, Caminhos, OutrosCaminhos),
									                             expande_aestrela(MelhorCaminho, ExpCaminhos, Destino),
									                             append(OutrosCaminhos, ExpCaminhos, NovoCaminhos),
        							                         aestrela(NovoCaminhos, SolucaoCaminho, Destino).		

obtem_melhor([Caminho], Caminho) :- !.

obtem_melhor([Caminho1/Custo1/Est1,_/Custo2/Est2|Caminhos], MelhorCaminho) :- Custo1 + Est1 =< Custo2 + Est2, !,
																			                                        obtem_melhor([Caminho1/Custo1/Est1|Caminhos], MelhorCaminho).
	
obtem_melhor([_|Caminhos], MelhorCaminho) :- obtem_melhor(Caminhos, MelhorCaminho).

expande_aestrela(Caminho, ExpCaminhos, Destino) :- findall(NovoCaminho, adj(Caminho, NovoCaminho, Destino), ExpCaminhos).

adj([Paragem|Caminho]/Custo/_, [Prox,Paragem|Caminho]/NovoCusto/Est, Destino) :- adjacente(Paragem, Prox, _, PassoCusto),
                                                                                 \+ member(Prox, Caminho),
																			                                           NovoCusto is Custo + PassoCusto,
																			                                           estima(Prox, Destino, Est).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %

% Escolher o percurso que passe apenas por paragens com publicidade (pesquisa em profundidade primeiro multi-estados)

com_publicidade(Origem, Destino, Caminho) :- paragem(Destino, _, _, _, _, Pub, _, _, _, _),
                                             pertence(Pub, ['Yes']),
                                             profundidade5(Origem, Destino, [Origem], Caminho),
                                             write('Trajeto: '),
                                             escrever(Caminho).

profundidade5(Destino, Destino, Visitados, Caminho) :- inverso(Visitados, Caminho).

profundidade5(Origem, Destino, Visitados, Caminho) :- adjacente_h5(Origem, Prox),
										                                  \+ member(Prox, Visitados),
										                                  profundidade5(Prox, Destino, [Prox|Visitados], Caminho).

adjacente_h5(Paragem, Prox) :- paragem(Paragem, _, _, _, _, Pub, _, _, _, _),
                               pertence(Pub, ['Yes']),
                               adjacente(Paragem, Prox, _, _).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %

% Escolher o percurso que passe apenas por paragens abrigadas (pesquisa em profundidade primeiro multi-estados)

com_abrigo(Origem, Destino, Caminho) :- paragem(Destino, _, _, _, TAb, _, _, _, _, _),
                                        nao(pertence(TAb, ['Sem Abrigo'])),
                                        profundidade6(Origem, Destino, [Origem], Caminho),
                                        write('Trajeto: '),
                                        escrever(Caminho).

profundidade6(Destino, Destino, Visitados, Caminho) :- inverso(Visitados, Caminho).

profundidade6(Origem, Destino, Visitados, Caminho) :- adjacente_h6(Origem, Prox),
										                                  \+ member(Prox, Visitados),
										                                  profundidade6(Prox, Destino, [Prox|Visitados], Caminho).

adjacente_h6(Paragem, Prox) :- paragem(Paragem, _, _, _, TAb, _, _, _, _, _),
                               nao(pertence(TAb, ['Sem Abrigo'])),
                               adjacente(Paragem, Prox, _, _).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %

% Escolher um ou mais pontos intermédios por onde o percurso deverá passar (pesquisa em profundidade primeiro multi-estados)

pontos_intermedios(Origem, Destino, Pontos, Caminho) :- pertence(Origem, Pontos),
                                                        remove(Origem, Pontos, L),
                                                        profundidade7(Origem, Destino, L, [Origem], Caminho),
                                                        write('Trajeto: '),
                                                        escrever(Caminho).

pontos_intermedios(Origem, Destino, Pontos, Caminho) :- nao(pertence(Origem, Pontos)),
                                                        profundidade7(Origem, Destino, Pontos, [Origem], Caminho),
                                                        write('Trajeto: '),
                                                        escrever(Caminho).

profundidade7(Destino, Destino, [], Visitados, Caminho) :- inverso(Visitados, Caminho).

profundidade7(Origem, Destino, Pontos, Visitados, Caminho) :- adjacente_h(Origem, Prox),
                                                              \+ member(Prox, Visitados),
                                                              pertence(Prox, Pontos),
                                                              remove(Prox, Pontos, L),
                                                              profundidade7(Prox, Destino, L, [Prox|Visitados], Caminho).

profundidade7(Origem, Destino, Pontos, Visitados, Caminho) :- adjacente_h(Origem, Prox),
                                                              \+ member(Prox, Visitados),
                                                              nao(pertence(Prox, Pontos)),
                                                              profundidade7(Prox, Destino, Pontos, [Prox|Visitados], Caminho).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %