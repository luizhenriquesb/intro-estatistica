
library(tidyverse)

# Aula de hoje foi sobre a média


# A média -----------------------------------------------------------------

# A média é bastante impactada pelo modo com que os dados se espalham no eixo X

# Medidas de dispersão ----------------------------------------------------

# As medidas de dispersão nos informam o quanto os dados se "espalham"

# A amplitude é uma medida (maximo - minimo)

# As mais comuns são o desvio-padrão e desvio-médio

### Desvio-médio ----

# o desvio absoluto médio é a média de quanto as observações se distanciam da
# média dos valores absolutos

x = c(1:4)

mean(x)

mean(x - mean(x)) # Desvios: x1 - média

### Desvio-absoluto ----

mean(abs(x - mean(x))) # O módulo é o comprimento do x_n até o 0 (zero)

# Por que caracterizar a incerteza? ---------------------------------------

# IMPORTANTE: --------------------------------------------------------------
## Como os dados foram gerados? --------------------------------------------

# A forma menos técnica e intuitiva é contar uma história. Por exemplo:

# 1. Lançamos um dado branco e um dado vermelho ao mesmo tempo
# 2. Calculamos a soma das faces de cada um dos dados (variavel "soma")

## Qual deveria ser o comportamento esperado da variável? -----------------

# Duas respostas:

# 1. Estudar o que a matemática envolvida nos lançamentos dos dados
# 2. Simular o nosso banco de dados varias vezes e estudar as características
# dessa amostra

dado_vermelho <- sample(1:6, size =1)
dado_branco <- sample(1:6, size =1)

lancando_5x <- sample(1:6, size = 5, replace = TRUE)

# O que esperamos que aconteça com as ***estatísticas amostrais***?











