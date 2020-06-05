library(neuralnet)

setwd("/Users/goncaloalmeida/Documents/Universidade/3º Ano/SRCR/Ficha 13")

trainset<-read.csv("Dados Normalizados.csv", header = TRUE, sep = ",", dec = ".")
head(trainset)

#o ~ significa de pendente
#A avaliacao depende dos fatores à direita
formulaRNA <- Avaliacao ~ Vencimento + Habitacao + Automovel + Cartao

creditnet <- neuralnet(formulaRNA, trainset, hidden = c(5), threshold = 0.1)

teste <- subset(trainset, select = c("Vencimento", "Habitacao", "Automovel", "Cartao"))
creditnet.results<-compute(creditnet, teste)

print(round(creditnet.results$net.result, digits = 0))
print(creditnet)
plot(creditnet)
print(creditnet$call)

creditnet$model.list

plot(creditnet)
plot(creditnet$covariate[,1], creditnet$response, type = "l")
plot(creditnet$covariate[,1], creditnet$response, type = "o")
plot(creditnet$covariate[,1], creditnet$response, type = "p")


test <- data.frame(Vencimento = 0.4, Habitacao = 0.2, Automovel = 0.4, Cartao = 0.1)
#na segunda linha vamos colocar os outros dados
test[2,] <-  data.frame(Vencimento = 0.7, Habitacao = 0.4, Automovel = 0.55, Cartao = 0.1)

creditnet.results <- compute(creditnet, test)

print(round(creditnet.results$net.result))
print(round(creditnet.results$net.result, digits = 1))