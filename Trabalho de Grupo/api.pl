:- consult('main.pl').

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
%|                                                                           Adjudicantes                                                                   |%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%

% Adicionar um adjudicante

add_adjudicante(N,NIF,M) :- id_adjudicante(IdAd),                  % get próximo id
                            write(IdAd),
                            evolucao(adjudicante(IdAd,N,NIF,M)).   % inserir conhecimento

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

% Remover um adjudicante

remove_adjudicante(IdAd) :- involucao(adjudicante(IdAd,_,_,_)).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

% Obter ids dos contratos de um adjudicante

get_contratos_adjudicante(IdAd,R) :- findall(IdC, contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano), R). 

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

% Obter o valor total dos contratos de um adjudicante criados num dado ano

get_valor_ano_adjudicante(IdAd,Ano,R) :- findall(V, contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano), S),
                                         soma(S,R1),
                                         R2 is R1 - integer(R1),
                                         R3 is R2 * 100,               
                                         R4 is integer(R3) / 100,
                                         R is integer(R1) + R4.

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
%|                                                                          Adjudicataria                                                                   |%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%

% Adicionar uma adjudicataria

add_adjudicataria(N,NIF,M) :- id_adjudicataria(IdAda),                  % get próximo id
                              write(IdAda),
                              evolucao(adjudicataria(IdAda,N,NIF,M)).   % inserir conhecimento

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

% Remover uma adjudicataria

remove_adjudicataria(IdAda) :- involucao(adjudicataria(IdAda,_,_,_)).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

% Obter ids dos contratos de um adjudicante

get_contratos_adjudicataria(IdAda,R) :- findall(IdC, contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano), R). 

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

% Obter o valor total dos contratos de uma adjudicataria criados num dado ano

get_valor_ano_adjudicataria(IdAda,Ano,R) :- findall(V, contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano), S),
                                            soma(S,R1),
                                            R2 is R1 - integer(R1),
                                            R3 is R2 * 100,               
                                            R4 is integer(R3) / 100,
                                            R is integer(R1) + R4.

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
%|                                                                            Contrato                                                                      |%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%

% Adicionar um contrato

add_contrato(IdAd,IdAda,TC,TP,D,V,P,L) :- id_contrato(IdC),                                               % get próximo id
                                          write(IdC),
                                          now(T),                                                         % get timestamp atual
                                          datime(T,Datime),                                               % converter o timestamp
                                          get_dia(Datime,Dia),                                            % get dia atual
                                          get_mes(Datime,Mes),                                            % get mes atual
                                          get_ano(Datime,Ano),                                            % get ano atual
                                          evolucao(contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano)).   % inserir conhecimento

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
%|                                                                    ESTADOS DE UM CONTRATO                                                                |%    
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%

% Predicado que cancela um contrato se este ainda estiver dentro do prazo.

cancelar(IdC) :- ( solucoes( IdC,
                             contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano),
                             S ),
                   comprimento(S,N),
                   N == 1 ), 
                 findall(P,contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano),R1),         % get R1 = [prazo]
                 head(R1,R2),                                                              % get R2 = prazo
                 findall(Dia,contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano),R3),       % get R3 = [dia]
                 head(R3,R4),                                                              % get R4 = dia
                 findall(Mes,contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano),R5),       % get R5 = [mes]
                 head(R5,R6),                                                              % get R6 = mes
                 findall(Ano,contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano),R7),       % get R7 = [ano]
                 head(R7,R8),                                                              % get R8 = ano
                 cmp_datas(R4,R6,R8,R2),                                                   % validar prazo
                 evolucao(cancelado(IdC)).                                                 % inserir conhecimento

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

% Predicado que arquiva um contrato se este já estiver expirado o seu prazo.

arquivar(IdC) :- ( solucoes( IdC,
                             contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano),
                             S ),
                   comprimento(S,N),
                   N == 1 ), 
                 findall(P,contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano),R1),         % get R1 = [prazo]
                 head(R1,R2),                                                              % get R2 = prazo
                 findall(Dia,contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano),R3),       % get R3 = [dia]
                 head(R3,R4),                                                              % get R4 = dia
                 findall(Mes,contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano),R5),       % get R5 = [mes]
                 head(R5,R6),                                                              % get R6 = mes
                 findall(Ano,contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano),R7),       % get R7 = [ano]
                 head(R7,R8),                                                              % get R8 = ano
                 nao(cmp_datas(R4,R6,R8,R2)),                                              % validar prazo
                 evolucao(arquivado(IdC)).                                                 % inserir conhecimento

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

% Predicado que devolve o estado de um contrato.

estado(IdC) :- findall(IdC,contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano),S),
               length(S,N),
               N == 0,
               write('contrato inexistente').

estado(IdC) :- findall(IdC,contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano),S1),
               length(S1,N1),
               N1 == 1,
               findall(IdC,cancelado(IdC),S2),
               length(S2,N2),
               N2 == 1,
               write('contrato cancelado').

estado(IdC) :- findall(IdC,contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano),S1),
               length(S1,N1),
               N1 == 1,
               findall(IdC,arquivado(IdC),S2),
               length(S2,N2),
               N2 == 1,
               write('contrato arquivado').

estado(IdC) :- findall(IdC,contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano),S1),
               length(S1,N1),
               N1 == 1,
               findall(IdC,cancelado(IdC),S2),
               length(S2,N2),
               N2 == 0,
               findall(IdC,arquivado(IdC),S3),
               length(S3,N3),
               N3 == 0,
               write('contrato em vigor').