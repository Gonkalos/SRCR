library(neuralnet)
library(hydroGOF)  # funções estatísticas
library(arules)    # análise de dados
library(leaps)     # preparação de dados

set.seed(1234567890)

setwd("./")

dados <- read.csv("creditset.csv")

head(dados)

treino <- dados[1:800,]

teste <- dados[801:2000,]

funcao01 <- default10yr ~ income + age + loan + LTI
selecao01 <- regsubsets(funcao01, dados, nvmax=3)
summary(selecao01)

funcao02 <- default10yr ~ clientid + income + age + loan + LTI
selecao02 <- regsubsets(funcao02, dados, method = "backward")
summary(selecao02)

nomes <- c(1,2,3,4,5)
income <- discretize(dados$income, method = "frequency", categories = 5, labels = nomes)
dados$income <- as.numeric(income)

formula01 <- default10yr ~ LTI + age

rnacredito <- neuralnet(formula01, treino, hidden = c(4), lifesign = "full", linear.output = FALSE, threshold = 0.1)

plot(rnacredito, rep = "best")

teste.01 <- subset(teste, select = c("LTI", "age"))

rnacredito.resultados <- compute(rnacredito, teste.01)

resultados <- data.frame(atual = teste$default10yr, previsao = rnacredito.resultados)

resultados$previsao <- round(resultados$previsao, digits = 0)

rmse(c(teste$default10yr), c(resultados$previsao))

View(resultados)

formula02 <- default10yr ~ age + loan + LTI

rede <- neuralnet(formula02, treino, hidden = c(3,2), threshold = 0.1)
plot(rede)

teste.01 <- subset(teste, select = c("age", "loan", "LTI"))

rede.resultados2 <- compute(rede, teste.01)

resultados2 <- data.frame(atual = teste$default10yr, previsao = rede.resultados2$net.result)

resultados2$previsao <- round(resultados2$previsao, digits = 0)

rmse(c(teste$default10yr), c(resultados2$previsao))