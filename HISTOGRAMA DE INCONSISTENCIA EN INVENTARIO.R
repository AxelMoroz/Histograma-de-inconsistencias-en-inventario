#############################################
# APLICACIÓN PRÁCTICA: HISTOGRAMA DE INCONSISTENCIA EN INVENTARIO
#############################################

# --------- 1. Simulación de datos reales -----------
# Supongamos que medimos diariamente la inconsistencia del inventario (en unidades)
# durante 150 días.

set.seed(123)
inconsistencia <- rnorm(150, mean = 0, sd = 3.5)  # media=0 ideal, desviación típica alta=variabilidad

# --------- 2. Definir límites de clase -----------
valor_minimo <- floor(min(inconsistencia))
valor_maximo <- ceiling(max(inconsistencia))
ancho_clase  <- 1
limites_clase <- seq(valor_minimo, valor_maximo, by = ancho_clase)

# --------- 3A. Histograma en base R -----------
hist(
  inconsistencia,
  breaks = limites_clase,
  right  = FALSE,          # incluye límite inferior
  col    = "lightgreen",
  border = "gray30",
  main   = "Histograma de Inconsistencia en Inventario (150 días)",
  xlab   = "Diferencia unidades (Inventario físico - Inventario registrado)",
  ylab   = "Frecuencia"
)

# Añadir líneas de control de calidad (-5 y 5 unidades aceptables)
abline(
  v = c(-5, 5),
  col = "red",
  lwd = 2,
  lty = 2
)

# --------- 3B. (Opcional) Histograma con ggplot2 -----------
# Si no tienes ggplot2: install.packages("ggplot2")
library(ggplot2)

datos <- data.frame(inconsistencia)

ggplot(datos, aes(x = inconsistencia)) +
  geom_histogram(
    breaks = limites_clase,
    colour = "black",
    fill   = "orange"
  ) +
  geom_vline(
    xintercept = c(-5, 5),
    colour     = "red",
    linetype   = "dashed",
    size       = 1
  ) +
  labs(
    title = "Histograma de Inconsistencia en Inventario (150 días)",
    x     = "Diferencia unidades (Inventario físico - Inventario registrado)",
    y     = "Frecuencia"
  ) +
  theme_minimal(base_size = 12)
datos
