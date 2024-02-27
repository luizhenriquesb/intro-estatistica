
library(tidyverse)

# Dados de clima ----------------------------------------------------------

chuvas <- readRDS("dados/chuvas_A701.rds")

# Dados de peso -----------------------------------------------------------

pesos <- readRDS("dados/dados_pesos.rds")

# Histograma --------------------------------------------------------------

X  <- chuvas$`Tair_mean (c)`

### hist() ----

hist(X)

# Os hisogramas do R, tanto do R base quanto do ggplot2, usam faixas de mesmo
# tamanho

min(X)
max(X)

# O numero de colunas nós contamos na mão:
numero_colunas <- 10

# Tamanho da faixa:
tamanho_faixa <- (max(X) - min(X))/10

# 1ª Faixa
min(X)

# 2ª Faixa
min(X) + tamanho_faixa

# 3ª Faixa
min(X) + tamanho_faixa*2

# ...

# Quantas faixas o histograma faz (ou deve fazer)? Qual o critério?

?hist

hist(X, breaks = "Scott")
hist(X, breaks = "Freedman-Diaconis")
hist(X, breaks = "Sturges") # default

# nclass.Sturges = ceiling(log2(length(x)) + 1)
ceiling(log2(length(X)) + 1)

# Nota: veja que a fórmula acima retorna 6, ou seja, o histograma deveria ter 6
# quebras, mas a função hist() criou 10 (apesar de usar a formula acima) quebras
# para a variavel X. Isso acontece porque hist() sempre *tenta* terminar uma quebra
# em um numero inteiro. É possivel passar # um argumento na unção hist() que
# desativa esse procedimento adicional que cria mais quebras

### ggplot2() ----

# Por padrão, o ggplot() cria 30 quebras (bins = 30). Isso acontece para que a
# a escolha das quebras não seja automatica (como acontece no caso da função hist)
# e para "incentivar" a escolha do próprio critério para o numero de quebras

chuvas |>
  ggplot(aes(x = `Tair_mean (c)`)) +
  geom_histogram(
    color = "white",
    bins = ceiling(log2(length(X)) + 1) # define o numero de bins (quebras)
  )

chuvas |>
  ggplot(aes(x = `Tair_mean (c)`)) +
  geom_histogram(
    color = "white",
    binwidth = 1 # altera o comprimento das barras
  )

# Histograma para comparações ---------------------------------------------

# O histograma abaixo nao é o mais adequado para comparações, porque a base tem
# mais qtdes diferentes de homens e mulheres
pesos |>
  ggplot(aes(x = wt)) +
  geom_histogram(
    bins = ceiling(log2(length(pesos$wt)) + 1),
    color = "white",
    fill = "royalblue"
  ) +
  theme_bw(15) +
  facet_wrap(~genero)

# Solução: histograma com a densidade
# Densidade: fazer com que a soma das barras do histograma dar sempre 1 (um)

pesos |>
  ggplot(aes(x = wt, fill = genero)) +
  geom_histogram(
    aes(y = ..density..), # argumento para criar a densidade
    bins = ceiling(log2(length(pesos$wt)) + 1),
    color = "white"
  ) +
  theme_bw(15) +
  facet_wrap(~genero) +
  theme(legend.position = "bottom")

# Homens
pesos |>
  filter(genero == "Homem") |>
  ggplot(aes(x = wt, fill = genero)) +
  geom_histogram(
    aes(y = ..density..), # argumento para criar a densidade
    bins = 7, # ceiling(log2(50) + 1)
    color = "white"
  ) +
  theme_bw(15) +
  facet_wrap(~genero) +
  theme(legend.position = "bottom")

# Mulheres
pesos |>
  filter(genero == "Mulher") |>
  ggplot(aes(x = wt, fill = genero)) +
  geom_histogram(
    aes(y = ..density..), # argumento para criar a densidade
    bins = 8, # ceiling(log2(100) + 1)
    color = "white"
  ) +
  theme_bw(15) +
  facet_wrap(~genero) +
  theme(legend.position = "bottom")

# Cada barra diz quantos por cento da base ela representa.
# A soma da largura (contagem) de cada base x altura de cada base deve dar 1

# Densidade
pesos |>
  ggplot(aes(x = wt, fill = genero)) +
  geom_density(
    # bins = 7,
    color = "white"
  ) +
  theme_bw(15) +
  facet_wrap(~genero) +
  theme(legend.position = "bottom")

# Definição de densidade: permite comparar areas de diferentes histogramas, porque
# as alturas estão em escalas diferentes











