
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %
% ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
%|                                                          PREDICADOS AUXILIARES                                                          |% 
% ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %

% Extensao do meta-predicado nao: Questao -> {V,F}

nao( Questao ) :- Questao, !, fail.
nao( Questao ).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %

% Inverter uma lista

inverso(Xs, Ys) :- inverso(Xs, [], Ys).

inverso([], Xs, Xs).
inverso([X|Xs],Ys, Zs) :- inverso(Xs, [X|Ys], Zs).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %

seleciona(E, [E|Xs], Xs).
seleciona(E, [X|Xs], [X|Ys]) :- seleciona(E, Xs, Ys).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %

% Calcular a distância entre duas paragens

estima(Paragem, Destino, Estima) :- paragem(Paragem, Lat1, Lon1, _, _, _, _, _, _, _),
                                    paragem(Destino, Lat2, Lon2, _, _, _, _, _, _, _),
                                    X is Lat2 - Lat1,
                                    Y is Lon2 - Lon1,
                                    X2 is exp(X,2),
                                    Y2 is exp(Y,2),
                                    Z is X2 + Y2,
                                    Estima is sqrt(Z).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %

% Escrever uma lista

escrever([]).
escrever([X]) :- write(X).
escrever([X|L]) :- write(X), write(','), escrever(L).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %

% Verificar se um elemento pertence a uma lista

pertence( X,[X|_] ).
pertence( X,[Y|L] ) :- X \= Y, pertence( X,L ).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %

% Remover um elemento de uma lista

remove(X, [], []).
remove(X, [X|T], T).
remove(X, [H|T], [H|L]) :- remove(X, T, L). 

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %

% Determinar o caminho com menos paragens dada uma lista de pares (caminho, tamanho)

menor(L, R) :- menor(L, [], 0, R).
menor([], Caminho, Tamanho, Caminho).
menor([(C,N)|T], [], 0, R) :- menor(T, C, N, R).
menor([(C,N)|T], Caminho, Tamanho, R) :- N < Tamanho, menor(T, C, N, R).
menor([(C,N)|T], Caminho, Tamanho, R) :- N >= Tamanho, menor(T, Caminho, Tamanho, R).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %

% Mostrar como executar os predicados

help(R) :- write('\n'),
           write('Trajeto entre dois pontos: trajeto(Origem, Destino, R)\n\n'),
           write('Trajeto que passe apenas por paragens com determinadas operadoras: com_operadoras(Origem, Destino, Operadoras, R)\n\n'),
           write('Trajeto que passe apenas por paragens sem determinadas operadoras: sem_operadoras(Origem, Destino, Operadoras, R)\n\n'),
           write('Trajeto identificando a paragem com o maior numero de carreiras: mais_carreiras(Origem, Destino, R)\n\n'),
           write('Trajeto com menos paragens: menos_paragens(Origem, Destino, R)\n\n'),
           write('Trajeto com menor distancia: menor_distancia(Origem, Destino, R)\n\n'),
           write('Trajeto que passe apenas por paragens com publicidade: com_publicidade(Origem, Destino, R)\n\n'),
           write('Trajeto que passe apenas por paragens abrigadas: com_abrigo(Origem, Destino, R)\n\n'),
           write('Trajeto que passe por determinados pontos intermedios: pontos_intermedios(Origem, Destino, Pontos, R)\n\n').

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - %