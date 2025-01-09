# Step 1 : Install necessary packages
install.packages(c("tidyverse", "readxl"))

# Load necessary library
library(dplyr)
library(readxl)

# Step 1: Read the datasets
students <- read_excel("students.xlsx")
parents <- read_excel("parents.xlsx")

#STEP 2: Inspect the structure of the dataset
cat("\nStructure of the Data:\n")
str(students)
str(parents)

# Step 3: Extract rows where 'parent_name' is empty or missing
students_without_parents <- students %>%
  filter(is.na(parent_name) | parent_name == "")  # Rows with missing parent_name

# Step 4: Save the dataset of students without parents to a CSV file
write.csv(students_without_parents, "students_without_parents.csv", row.names = FALSE)

# Step 5: Filter students who have valid parent_name
students_with_parents <- students %>%
  filter(!(is.na(parent_name) | parent_name == ""))  # Rows with valid parent_name


# Step 7: Perform the inner join for students with valid parents
modified_students <- students_with_parents %>%
  inner_join(parents, by = "parent_name")

# Step 8: Save the final joined dataset to a CSV file
write.csv(modified_students, "modified_students.csv", row.names = FALSE)