
# Iniitially Loading our Data
alc_consumption <- read.csv('~/Downloads/archive/student-mat.csv')
alc_consumption

# Inspecting the Data 
# Check the structure of the dataset
str(alc_consumption)

# Get a summary of each column (numeric and categorical variables)
summary(alc_consumption)
colnames(alc_consumption)


# Count the total number of missing values in the dataset
sum(is.na(alc_consumption))

# Count the number of rows and columns 
nrow(alc_consumption)
ncol(alc_consumption)

# Example: Check unique values in 'school'
unique(alc_consumption$school)

# Repeat for other categorical columns
unique(alc_consumption$sex)
unique(alc_consumption$address)
unique(alc_consumption$Pstatus)

# Count duplicate rows
sum(duplicated(alc_consumption))





