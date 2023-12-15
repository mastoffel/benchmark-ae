library(tidyverse)
library(here)

#------------------------------------------------------------
# UVic model

# load UVic data
load(here("data", "climate", "raw", "TestDataSets", "UVic.rda"))

design
write_csv(design, here("data", "climate", "processed", "parameter.csv"),
          col_names = FALSE)

# transpose sim.co2 data.frame
sim.co2_t <- t(sim.co2)
write_csv(as.data.frame(sim.co2_t), here("data", "climate", "processed", "output.csv"),
          col_names = FALSE)

# there is also other output data:
# sim.flux
dim(t(sim.flux))

# Keeling observed physical measurements of CO2 values
str(field.flux)
str(field.co2)

#------------------------------------------------------------
# Climate model, probably GENIE

# https://www.nature.com/articles/s41558-018-0197-7
df <- read_csv(here("data", "climate",  "genie", "raw", "Holden2018.csv"))

outputs <- df %>% 
                select(SAT, ACC, VEGC, SOILC,
                       MAXPMOC, OCN_O2, fCaCO3, SIAREA_S)

parameters <- df %>% select(2:34)

write_csv(outputs, here("data", "climate", "genie", "processed", "outputs.csv"), col_names = FALSE)
write_csv(parameters, here("data", "climate", "genie", "processed", "parameters.csv"), col_names = FALSE)

#------------------------------------------------------------
# paleo data, spherical
df <- read_delim(here("data", "climate", "paleo", "raw", "ModelData_comparison.txt"),
                 col_names = TRUE)

parameters <- df %>% select(1:2)
outputs <- df[3]

write_csv(outputs, here("data", "climate", "paleo", "processed", "outputs.csv"), col_names = FALSE)
write_csv(parameters, here("data", "climate", "paleo", "processed", "parameters.csv"), col_names = FALSE)
