# Summary statistics for numeric variables
summary(alc_consumption)

# Correlation matrix for numeric variables
cor(alc_consumption[, sapply(alc_consumption, is.numeric)])

# Install ggplot2 if not already installed
library(ggplot2)

# Example: Distribution of final grades (G3)
ggplot(alc_consumption, aes(x = G3)) +
  geom_histogram(binwidth = 1, fill = "blue", color = "black") +
  labs(title = "Distribution of Final Grades", x = "Final Grade (G3)", y = "Frequency")


