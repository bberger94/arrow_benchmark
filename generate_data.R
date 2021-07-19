# --------------------------------- #
# Generate data for benchmarking
# --------------------------------- #

library(tidyverse)
library(haven)
library(arrow)

# Generate data
print("Generating data")
set.seed(101)
n <- 1e6

# Fifty string variables
m1 <- replicate(50, sample(LETTERS, n, replace = T))
# Fifty floating point variables
m2 <- replicate(50, rnorm(n))

# Join together
data <- cbind(m1, m2)
data <- as_tibble(data)

# Save data
cat("Saving CSV!\n")
write_csv(data, "data/data.csv")
cat("Saving DTA!\n")
write_dta(data, "data/data.dta")
cat("Saving PARQUET!\n")
write_parquet(data, "data/data.parquet")


