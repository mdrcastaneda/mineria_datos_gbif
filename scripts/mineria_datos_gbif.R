library(tidyverse)


# Vamos a hacer cambios en el archivo
#
data <- read.csv("~/Desktop/CLASES/Icesi/*Analisis de Datos II (Bioinformática)/Talleres/mineria_datos_gbif/data/gbifdata_tfuscater.csv")
write.csv(data, file = "data/testDATA.csv")

#### Explore su archivo resultante y responda:
#- En qué departamentos se ha registrado la especie, y cuántos registros
# hay para cada departamento?
table(data$stateProvince)

# Bogotá está escrito de tres formas diferentes... estandaricemos!

data <- data %>%
  mutate(stateProvince = str_replace(stateProvince, "Distrito Capital de Bogotá", "Bogotá, D.C.")) %>%
  mutate(stateProvince = str_replace(stateProvince, "Bogota Capital District", "Bogotá, D.C."))

table(data$stateProvince)

# En qué países se encuentran los especímenes?

table(data$publishingCountry)

# de qué años

table(data$year)


ti <- name_backbone(name = "Turdus ignobilis", rank = "species")
ti$usageKey

tignobilis <- occ_search(taxonKey =  ti$usageKey,
                        country = "CO", limit = 1000,
                        hasCoordinate = TRUE,
                        hasGeospatialIssue = FALSE,
                        fields = c("key", "taxonKey", "scientificName",
                                   "decimalLongitude", "decimalLatitude",
                                   "eventDate", "basisOfRecord",
                                   "countryCode", "stateProvince",
                                   "locality", "datasetKey",
                                   "publishingCountry", "year",
                                   "occurrenceStatus"))




