library(SCperf)

d <- 500000
k <- 8000
h <- 1.5

model <- EOQ(d, k, h)
model

# resultado
#      Q       T        TVC
# 73029.67  0.15  109544.51

# calcular cada cuanto se debe realizar un pedido
t <- 0.15 * 365
t

# calcular cuantas ordenes se deberan realizar en un anio
Q <- 73029.69
p_anio <- d / Q
p_anio

# calcular el costo variable total de gestion de inventarios
TVC <- 109544.51
TVC
