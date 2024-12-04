install.packages("e1071")  # For Naive Bayes
install.packages("ggplot2")  # For visualizations
install.packages("dplyr")  # For data manipulation

# Load required libraries
library(e1071)
library(ggplot2)
library(dplyr)

# Load datasets
math_data <- read.csv("student-mat.csv", sep = ";")
por_data <- read.csv("student-por.csv", sep = ";")

# Combine the datasets if necessary
combined_data <- bind_rows(math_data, por_data)

# Convert categorical variables to factors
combined_data$sex <- as.factor(combined_data$sex)
combined_data$address <- as.factor(combined_data$address)
combined_data$famsize <- as.factor(combined_data$famsize)
combined_data$schoolsup <- as.factor(combined_data$schoolsup)

# Define target variable and predictors
target <- "Dalc"  # Or 'Walc'
predictors <- c("age", "sex", "studytime", "failures", "schoolsup", "goout")

# Subset data
subset_data <- combined_data %>%
  select(all_of(c(predictors, target))) %>%
  na.omit()  # Remove rows with missing values

# Convert the target variable to a factor for Naive Bayes
subset_data[[target]] <- as.factor(subset_data[[target]])

# Split data into training and testing sets
set.seed(42)
train_indices <- sample(1:nrow(subset_data), 0.7 * nrow(subset_data))
train_data <- subset_data[train_indices, ]
test_data <- subset_data[-train_indices, ]

# Naive Bayes Model
nb_model <- naiveBayes(as.formula(paste(target, "~", paste(predictors, collapse = "+"))), data = train_data)
nb_predictions <- predict(nb_model, test_data)

# Evaluate Naive Bayes
nb_confusion_matrix <- table(Predicted = nb_predictions, Actual = test_data[[target]])
print("Naive Bayes Confusion Matrix:")
print(nb_confusion_matrix)

# OLS Regression
ols_model <- lm(as.formula(paste(target, "~", paste(predictors, collapse = "+"))), data = train_data)
summary(ols_model)

# Predict using OLS
ols_predictions <- predict(ols_model, test_data)

# Evaluate OLS
ols_rmse <- sqrt(mean((as.numeric(test_data[[target]]) - as.numeric(ols_predictions))^2))
cat("OLS RMSE:", ols_rmse, "\n")
