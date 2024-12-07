install.packages("tidyverse")
library(dplyr)
library(ggplot2)

alc_consumption <- read.csv('~/Downloads/archive/student-mat.csv',header =TRUE)
d2 <- read.csv('~/Downloads/archive/student-por.csv', header = TRUE)


d3 = merge(alc_consumption, d2, by = c("Dalc", "failures", "goout", "absences", "studytime", "famrel", "Pstatus"), suffixes = c("", ".y"))

d3 <- d3[!is.na(d3$G3), ]
colnames(d3)

data <- d3[ , c("G3", "Dalc", "Walc", "failures", "goout", "absences", "studytime", "famrel", "Pstatus", "G1", "G2","Medu","Fedu")]
head(data)

data$Pstatus <- as.factor(data$Pstatus)

model <- lm(G3 ~ Dalc + Walc + failures + goout + absences + studytime + famrel + Pstatus + G1 + G2 + Medu + Fedu, data = data)
summary(model)


