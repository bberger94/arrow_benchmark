# --------------------- #
# Run Benchmark Tests
# --------------------- #
library(tidyverse)
library(haven)
library(arrow)

# .csv Benchmark (with specified column types)
time_csv <- system.time({
  data <- read_csv("data/data.csv", 
                   col_types = paste0(c(rep("c", 50),
                                        rep("n", 50)),
                                      collapse = ""))
})


time_csv_v10 <- system.time({
  data <- read_csv("data/data.csv", 
                   col_types = cols_only(V1 = "c",
                                         V2 = "c",
                                         V3 = "c",
                                         V4 = "c",
                                         V5 = "c",
                                         V6 = "c",
                                         V7 = "c",
                                         V8 = "c",
                                         V9 = "c",
                                         V10 = "c"))
})


time_csv_v1 <- system.time({
  data <- read_csv("data/data.csv", col_types = cols_only(V1 = "c"))
})


# .dta Benchmark
time_dta <- system.time({
  data <- read_dta("data/data.dta")
})

time_dta_v10 <- system.time({
  data <- read_dta("data/data.dta", col_select = 1:10)
})

time_dta_v1 <- system.time({
  data <- read_dta("data/data.dta", col_select = 1)
})


# Arrow Benchmark
time_arrow <- system.time({
  data <- read_parquet("data/data.parquet")
})

time_arrow_v10 <- system.time({
  data <- read_parquet("data/data.parquet", col_select = 1:10)
})

time_arrow_v1 <- system.time({
  data <- read_parquet("data/data.parquet", col_select = 1)
})


# Entire Dataset
cat("Running Benchmarks!\n")
sink("benchmark.txt")
cat("=============================\n")
cat("Elapsed Time: All Columns\n")
cat("=============================\n")

print(
  c("csv" = time_csv["elapsed"],
    "dta" = time_dta["elapsed"],
    "arrow" = time_arrow["elapsed"])
)

# Columns 1-10
cat("=============================\n")
cat("Elapsed Time: Column 1-10\n")
cat("=============================\n")

print(
  c("csv" = time_csv_v10["elapsed"],
    "dta" = time_dta_v10["elapsed"],
    "arrow" = time_arrow_v10["elapsed"])
)

# Column 1
cat("=============================\n")
cat("Elapsed Time: Column 1\n")
cat("=============================\n")

print(
  c("csv" = time_csv_v1["elapsed"],
    "dta" = time_dta_v1["elapsed"],
    "arrow" = time_arrow_v1["elapsed"])
)
sink()


