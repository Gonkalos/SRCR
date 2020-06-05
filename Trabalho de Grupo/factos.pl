% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
%|                                                                            FACTOS                                                                        |%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%

% Inserção de Adjudicantes

% Extensao do predicado adjudicante: IdAd, N, NIF, M -> {V,F}

adjudicante(1, 'Eduardo Ferreira', 700048781, 'Cernache do Bonjardim').
adjudicante(2, 'Orlando Amorim', 154705563, 'Alhandra').
adjudicante(3, 'Valentina Henriques', 220621364, 'Boticas').
adjudicante(4, 'Madeleine McCann', 563343317, 'Luz').
adjudicante(5, 'Vitor Leite', 233531777, 'Manteigas').
adjudicante(6, 'Hugo Antunes', 508648136, 'Carregado').
adjudicante(7, 'Rodolfo Branco', 527402224, 'Serra da Estrela').
adjudicante(8, 'Marcos Tavares', 234534531, 'Bombarral').
adjudicante(9, 'Zacarias Matos',  337133801, 'Montelavar').
adjudicante(10, 'William Pinto', 530788766, 'Nelas').
adjudicante(11, 'Valentim Garcia', 746735673, 'Caranguejeira').
adjudicante(12, 'Aida Melo', 113063545, 'Amares').
adjudicante(13, 'Manuela Morais', 453575823, 'Castro Daire').
adjudicante(14, 'Benjamim Campos', 846437787, 'Carnaxide').
adjudicante(15, 'Daniela Machado', 758862864, 'Vila do Conde').
adjudicante(16, 'Guilhermina Martins', 703000052, 'Alvito').
adjudicante(17, 'Rui Pedro', 655256365, 'Ferreira do Alentejo').
adjudicante(18, 'Frederica Martins', 513266124, 'Paredes').
adjudicante(19, 'Bruna Soares', 811236624, 'Castanheira de Pera').
adjudicante(20, 'Alexandre Neves', 452175840, 'Figueira de Castelo Rodrigo').


% Inserção de Adjudicatarias

% Extensao do predicado adjudicataria: IdAda, N, NIF, M -> {V,F}

adjudicataria(1, 'COFINA MEDIA, S.A.', 288881114, 'Ferrel').
adjudicataria(2, 'LISBOAGAS GDL - SOCIEDADE DISTRIBUIDORA DE GAS NATURAL DE LISBOA, S.A.', 416173057, 'Baiao').
adjudicataria(3, 'AGRUPALTO - AGRUPAMENTO DE PRODUTORES AGROPECUARIOS, S.A.', 133136500, 'Carvalho de Espingarda as Costas').
adjudicataria(4, 'SOAUTO - COMERCIO DE AUTOMOVEIS, S.A.', 661010031, 'Mogadouro').
adjudicataria(5, 'AVIPRONTO - PRODUTOS ALIMENTARES, S.A.', 101642875, 'Castanheira de Pera').
adjudicataria(6, 'DATABOX - INFORMATICA, S.A.', 130618810, 'Coruche').
adjudicataria(7, 'ARCOL, S.A.', 707857376, 'Crato').
adjudicataria(8, 'ARROWECS PORTUGAL, SOCIEDADE UNIPESSOAL, LDA', 455735168, 'Carrazeda de Ansiaes').
adjudicataria(9, 'CONSTANTINO FERNANDES OLIVEIRA & FILHOS, S.A.', 336086015, 'Ferreira do Zezere').
adjudicataria(10, 'SORGAL - SOCIEDADE DE OLEOS E RACOES, S.A.', 586086015, 'Freixo de Espada a Cinta').


% Inserção de Contratos

% Extensao do predicado contrato: IdC, IdAd, IdAda, TC, TP, D, V, P, L, Dia, Mes, Ano -> {V,F}

contrato(1,  4 , 3,'contrato de aquisicao', 'ajuste direto', 'contrato de aquisicao de um bem', 2761.13, 246, 'Marinha das Ondas', 11, 1, 2018).
contrato(2,  11, 6,'locacao de bens moveis', 'ajuste direto', 'contrato de locacao de um ou mais bens moveis', 390.51, 218, 'Canical', 26, 2, 2011).
contrato(3,  9 , 4,'contrato de arrendamento', 'concurso publico', 'contrato de arrendamento de imovel', 91017.60, 466, 'Aveiras de Cima', 13, 8, 2013).
contrato(4,  19, 4,'compra de carro', 'consulta previa', 'contrato de compra ou venda de veiculo', 83768.80, 506, 'Linda-a-Velha', 0, 3, 2019).
contrato(5,  13, 9,'aquisicao de servicos', 'ajuste direto', 'contrato de aquisicao de servicos', 1181.86, 134, 'Alandroal', 6, 4, 2014).
contrato(6,  8 , 4,'compra de carro', 'concurso publico', 'contrato de compra ou venda de veiculo', 1689.44, 247, 'Alfandega da Fe', 5, 10, 2016).
contrato(7,  9 , 2,'contrato de habitacao', 'concurso publico', 'contrato de arrendamento de habitacao', 33116.98, 990, 'Mira de Aire', 3, 5, 2019).
contrato(8,  14, 7,'compra de carro', 'concurso publico', 'contrato de compra ou venda de veiculo', 1985.46, 315, 'Apulia', 11, 9, 2014).
contrato(9,  11, 3,'aquisicao de servicos', 'ajuste direto', 'contrato de aquisicao de servicos', 3323.13, 311, 'Caminha', 17, 6, 2012).
contrato(10, 16, 3,'contrato de arrendamento', 'consulta previa', 'contrato de arrendamento de imovel', 83447.72, 197, 'Mira', 11, 7, 2017).
contrato(11, 6 , 5,'compra de carro', 'consulta previa', 'contrato de compra ou venda de veiculo', 2150.57, 650, 'Canecas', 27, 7, 2016).
contrato(12, 13, 1,'contrato de trabalho', 'consulta previa', 'contrato de trabalho a termo certo', 81678.70, 778, 'Lousa', 27, 11, 2013).
contrato(13, 14, 4,'compra de carro', 'consulta previa', 'contrato de compra ou venda de veiculo', 69245.32, 352, 'Barrancos', 26, 1, 2019).
contrato(14, 9 , 5,'contrato de trabalho', 'concurso publico', 'contrato de trabalho a termo certo', 23080.46, 805, 'Cumieira', 6, 3, 2013).
contrato(15, 6 , 6,'contrato de trabalho', 'concurso publico', 'contrato de trabalho a termo certo', 3770.60, 667, 'Condeixa-a-Nova', 25, 1, 2012).
contrato(16, 19, 7,'locacao de bens moveis', 'ajuste direto', 'contrato de locacao de um ou mais bens moveis', 2977.99, 358, 'Fornos de Algodres', 28, 2, 2012).
contrato(17, 14, 6,'aluguer', 'concurso publico', 'contrato de aluguer', 64318.17, 626, 'Campo de Besteiros', 16, 1, 2017).
contrato(18, 9 , 5,'aluguer', 'consulta previa', 'contrato de aluguer', 61904.20, 26, 'Corvo', 0, 12, 2018).
contrato(19, 6 , 9,'locacao de bens moveis', 'ajuste direto', 'contrato de locacao de um ou mais bens moveis', 4329.24, 186, 'Arruda dos Vinhos', 21, 5, 2016).
contrato(20, 8 , 9,'contrato de arrendamento', 'concurso publico', 'contrato de arrendamento de imovel', 20819.35, 646, 'Avanca', 14, 5, 2018).
contrato(21, 14, 2,'contrato de arrendamento', 'consulta previa', 'contrato de arrendamento de imovel', 47304.45, 606, 'Nordeste', 17, 4, 2012).
contrato(22, 19, 7,'compra de carro', 'consulta previa', 'contrato de compra ou venda de veiculo', 45546.58, 598, 'Cumieira', 19, 8, 2011).
contrato(23, 18, 7,'contrato de aquisicao', 'ajuste direto', 'contrato de aquisicao de um bem', 4348.36, 170, 'Mogadouro', 29, 11, 2011).
contrato(24, 19, 5,'contrato de habitacao', 'concurso publico', 'contrato de arrendamento de habitacao', 25145.97, 663, 'Monforte', 27, 5, 2015).
contrato(25, 1 , 4,'contrato de aquisicao', 'ajuste direto', 'contrato de aquisicao de um bem', 1731.16, 110, 'Chamusca', 23, 6, 2019).
contrato(26, 10, 2,'compra de carro', 'concurso publico', 'contrato de compra ou venda de veiculo', 34358.66, 172, 'Marvao', 10, 6, 2018).
contrato(27, 8 , 7,'aluguer', 'concurso publico', 'contrato de aluguer', 81789.45, 834, 'Calheta', 29, 11, 2019).
contrato(28, 12, 2,'contrato de arrendamento', 'concurso publico', 'contrato de arrendamento de imovel', 38962.08, 261, 'Alhadas', 27, 5, 2015).
contrato(29, 17, 2,'locacao de bens moveis', 'ajuste direto', 'contrato de locacao de um ou mais bens moveis', 3919.66, 251, 'Arganil', 19, 7, 2016).
contrato(30, 19, 7,'contrato de habitacao', 'consulta previa', 'contrato de arrendamento de habitacao', 35347.26, 786, 'Ferreira do Alentejo', 4, 5, 2017).
contrato(31, 6 , 8,'locacao de bens moveis', 'ajuste direto', 'contrato de locacao de um ou mais bens moveis', 1339.54, 356, 'Alcanena', 14, 12, 2013).
contrato(32, 12, 2,'contrato de habitacao', 'consulta previa', 'contrato de arrendamento de habitacao', 66103.82, 785, 'Mortagua', 3, 3, 2015).
contrato(33, 1 , 3,'contrato de trabalho', 'consulta previa', 'contrato de trabalho a termo certo', 86284.71, 901, 'Arrifana', 2, 12, 2016).
contrato(34, 14, 3,'locacao de bens moveis', 'ajuste direto', 'contrato de locacao de um ou mais bens moveis', 4834.41, 219, 'Castelo de Paiva', 24, 12, 2015).
contrato(35, 5 , 8,'aluguer', 'concurso publico', 'contrato de aluguer', 38136.82, 404, 'Idanha-a-Nova', 21, 12, 2017).
contrato(36, 3 , 2,'contrato de aquisicao', 'ajuste direto', 'contrato de aquisicao de um bem', 1192.87, 32, 'Murtosa', 24, 2, 2015).
contrato(37, 13, 7,'contrato de habitacao', 'consulta previa', 'contrato de arrendamento de habitacao', 2346.74, 832, 'Mogadouro', 2, 7, 2012).
contrato(38, 4 , 2,'compra de carro', 'concurso publico', 'contrato de compra ou venda de veiculo', 27029.95, 318, 'Marinha das Ondas', 16, 4, 2013).
contrato(39, 2 , 2,'contrato de habitacao', 'concurso publico', 'contrato de arrendamento de habitacao', 24278.61, 721, 'Alpiarca', 17, 10, 2011).
contrato(40, 13, 9,'contrato de arrendamento', 'concurso publico', 'contrato de arrendamento de imovel', 33252.79, 991, 'Amares', 24, 11, 2018).
contrato(41, 8 , 9,'contrato de arrendamento', 'consulta previa', 'contrato de arrendamento de imovel', 68444.59, 12, 'Arronches', 14, 5, 2016).
contrato(42, 15, 5,'contrato de trabalho', 'concurso publico', 'contrato de trabalho a termo certo', 13413.61, 532, 'Moimenta da Beira', 12, 2, 2014).
contrato(43, 12, 3,'contrato de aquisicao', 'ajuste direto', 'contrato de aquisicao de um bem', 2579.32, 338, 'Cabeceiras de Basto', 21, 5, 2018).
contrato(44, 12, 7,'contrato de aquisicao', 'ajuste direto', 'contrato de aquisicao de um bem', 3684.83, 52, 'Avis', 4, 6, 2017).
contrato(45, 16, 9,'contrato de trabalho', 'concurso publico', 'contrato de trabalho a termo certo', 46638.28, 715, 'Baiao', 26, 9, 2014).
contrato(46, 14, 1,'aluguer', 'consulta previa', 'contrato de aluguer', 97784.75, 375, 'Lousada', 4, 7, 2017).
contrato(47, 14, 9,'contrato de habitacao', 'concurso publico', 'contrato de arrendamento de habitacao', 67620.97, 550, 'Baltar', 2, 11, 2015).
contrato(48, 2 , 5,'locacao de bens moveis', 'ajuste direto', 'contrato de locacao de um ou mais bens moveis', 2857.45, 156, 'Lousada', 22, 2, 2018).
contrato(49, 3 , 9,'contrato de aquisicao', 'ajuste direto', 'contrato de aquisicao de um bem', 2533.91, 46, 'Ancas', 8, 1, 2017).
contrato(50, 19, 3,'contrato de aquisicao', 'ajuste direto', 'contrato de aquisicao de um bem', 3640.41, 22, 'Boticas', 29, 2, 2011).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
%|                                                                         CONHECIMENTO INCERTO                                                             |%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%

% Não existe na base de conhecimento a morada da Teodora, apesar de esta existir 

adjudicante(21,'Teodora Fernandes',293498947,x001).
excecao(adjudicante(IdAd,Nome,Nif,_)) :- adjudicante(IdAd,Nome,Nif,x001).

% Não existe na base de conhecimento o NIF do Alexandre, apesar de este existir

adjudicante(22,'Alexandre Santos',x002,'Vila do Conde').
excecao(adjudicante(IdAd,Nome,_,Morada)) :- adjudicante(IdAd,Nome,x002,Morada).

% Não existe na base de conhecimento o nome do adjudicante com id 23, apesar de este existir

adjudicante(23,x003,825402749,'Fajoses').
excecao(adjudicante(IdAd,_,NIF,Morada)) :- adjudicante(IdAd,x003,NIF,Morada).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%

% Não existe na base de conhecimento a morada do Pica Pau, apesar de esta existir 

adjudicataria(11,'Pica Pau',826502849,x004).
excecao(adjudicataria(IdAda,Nome,Nif,_)) :- adjudicataria(IdAda,Nome,Nif,x004).

% Não existe na base de conhecimento o NIF do Paraquedas, apesar de este existir

adjudicataria(12,'Paraquedas',x005,'Vila do Conde').
excecao(adjudicataria(IdAda,Nome,_,Morada)) :- adjudicataria(IdAda,Nome,x005,Morada).

% Não existe na base de conhecimento o nome da adjudicataria com id 13, apesar de este existir

adjudicataria(13,x006,923857274,'Fajoses').
excecao(adjudicataria(IdAda,_,NIF,Morada)) :- adjudicataria(IdAda,x006,NIF,Morada).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%

% Não existe na base de conhecimento o local do contrato com id 51, apesar de este existir

contrato(51, 5, 1,'contrato de aquisicao', 'ajuste direto', 'contrato de aquisicao de um bem', 335.54, 74, x007, 24, 8, 2017).


excecao(adjudicante(IdAd,Nome,Nif,_)) :- adjudicante(IdAd,Nome,Nif,x001).
excecao(adjudicante(IdAd,Nome,_,Morada)) :- adjudicante(IdAd,Nome,x002,Morada).
excecao(adjudicante(IdAd,_,NIF,Morada)) :- adjudicante(IdAd,x003,NIF,Morada).

excecao(adjudicataria(IdAda,Nome,Nif,_)) :- adjudicataria(IdAda,Nome,Nif,x004).
excecao(adjudicataria(IdAda,Nome,_,Morada)) :- adjudicataria(IdAda,Nome,x005,Morada).
excecao(adjudicataria(IdAda,_,NIF,Morada)) :- adjudicataria(IdAda,x006,NIF,Morada).

excecao(contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,_,Dia,Mes,Ano)) :- contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,x007,Dia,Mes,Ano).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
%|                                                                        CONHECIMENTO IMPRECISO                                                            |%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%

% A Morada do Manuel é Braga ou Póvoa de Lanhoso

excecao(adjudicante(24,'Manuel Aragao',285612438,'Braga')).
excecao(adjudicante(24,'Manuel Aragao',285612438,'Povoa de Lanhoso')).

% O Nif da Adjudicatária Maquinaria Pesada Unipessoal é 765231987 ou 865231987.

excecao(adjudicataria(14,'Maquinaria Pesada Unipessoal',765231987,'Montalegre')).
excecao(adjudicataria(14,'Maquinaria Pesada Unipessoal',865231987,'Montalegre')).

% Entre o dia 1 e 17, do mes de Dezembro de 2019, foi da assinado o contrato de trabalho com id 100.

excecao(contrato(52, 15, 2, 'contrato de trabalho', 'concurso publico', 'contrato de trabalho a termo certo', 345.1, 10, 'Tavira', D, 12, 2019)) :- D >= 1, D =< 17.

% Sabe-se que o valor do contrato com idContrato 101 está compreendido entre os 1000€ e os 2500€

excecao(contrato(53, 1 , 10,'contrato de aquisicao', 'ajuste direto', 'contrato de aquisicao de um bem', V, 716, 'Bairrada', 23, 3, 2013)) :- V > 1000, V < 2500.

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
%|                                                                      CONHECIMENTO INTERDITO                                                              |%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%

adjudicante(25, x008, 938274920, 'Moreira').
excecao(adjudicante(IdAd, Nome, Nif, Morada)) :- adjudicante(IdAd, x008, Nif, Morada).
nulo(x008).

+adjudicante(IdAd,Nome,Nif,Morada) :: ( solucoes( Nome,
                                                  (adjudicante(25, Nome, 938274920, 'Moreira'),
                                                  nao(nulo(Nome))),
                                                  S ),
                                        comprimento(S,0) ).

adjudicante(26, 'Deolinda Matavento', x009, 'Maia').
excecao(adjudicante(IdAd, Nome, Nif, Morada)) :- adjudicante(IdAd, Nome, x009, Morada).
nulo(x009).

+adjudicante(IdAd,Nome,Nif,Morada) :: ( solucoes( Nif,
                                                  (adjudicante(26, 'Deolinda Matavento', Nif, 'Maia'),
                                                  nao(nulo(Nif))),
                                                  S ),
                                        comprimento(S,0) ).

adjudicante(27, 'Gertrudes Ganza', 927492846, x010).
excecao(adjudicante(IdAd, Nome, Nif, Morada)) :- adjudicante(IdAd, Nome, Nif, x010).
nulo(x010).

+adjudicante(IdAd,Nome,Nif,Morada) :: ( solucoes( Morada,
                                                  (adjudicante(27, 'Gertrudes Ganza', 927492846, Morada),
                                                  nao(nulo(Morada))),
                                                  S ),
                                        comprimento(S,0) ).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

adjudicataria(15, x011, 472947264, 'Caxinas').
excecao(adjudicataria(IdAda,Nome,Nif,Morada)) :- adjudicataria(IdAda, x011, Nif, Morada).
nulo(x011).

+adjudicataria(IdAda,Nome,Nif,Morada) :: ( solucoes( Nome,
                                                     (adjudicataria(15, Nome, 472947264, 'Caxinas'),
                                                     nao(nulo(Nome))),
                                                     S ), 
                                           comprimento(S,0) ).

adjudicataria(16, 'Jardim Melhor', x012, 'Rates').
excecao(adjudicataria(IdAda,Nome,Nif,Morada)) :- adjudicataria(IdAda, Nome, x012, Morada).
nulo(x012).

+adjudicataria(IdAda,Nome,Nif,Morada) :: ( solucoes( Nif,
                                                     (adjudicataria(16, 'Jardim Melhor', Nif, 'Rates'),
                                                     nao(nulo(Nif))),
                                                     S ), 
                                           comprimento(S,0) ).

adjudicataria(17, 'Pesca Nova', 848294023, x013).
excecao(adjudicataria(IdAda,Nome,Nif,Morada)) :- adjudicataria(IdAda,Nome,Nif,x013).
nulo(x013).

+adjudicataria(IdAda,Nome,Nif,Morada) :: ( solucoes( Morada,
                                                     (adjudicataria(17, 'Pesca Nova', 848294023, Morada),
                                                     nao(nulo(Morada))),
                                                     S ), 
                                           comprimento(S,0) ).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

contrato(54, 14, 6, 'compra de carro', 'concurso publico', x014, 1339.54, 356, 'Alvalade', 27, 7, 2015).
excecao(contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano)) :- contrato(IdC,IdAd,IdAda,TC,TP,x014,V,P,L,Dia,Mes,Ano).
nulo(x014).

+contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano) :: ( solucoes( D,
                                                                   (contrato(54, 14, 6, 'compra de carro', 'concurso publico', D, 1339.54, 356, 'Alvalade', 27, 7, 2015),
                                                                   nao(nulo(D))),
                                                                   S ),
                                                         comprimento(S,0) ).

                                        