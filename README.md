# R Benchmarking
Test read speeds for `readr::read_csv`, `haven::read_dta`, and `arrow::read_parquet`. 

## Installation
Install required R packages using the following:

```
install.packages(c("tidyverse", "arrow"))
```

## Running 
The code is split into two scripts. `generate_data.R` generates fake data, saving it in three formats (about 3GB total). `benchmark.R` loads that data using the three methods above and calculates total elapsed time. `benchmark.R` also calculates the total time to just read the first column of the data. 

```
run_scripts.sh &
```

## Results
See `benchmark.txt`. `read_csv` performs the best at reading the entire dataset, followed distantly by `read_parquet` and even further by `read_dta`. In contrast, `read_parquet` performs the best at reading a subset of columns, followed by `read_dta` and far behind `read_csv`. This suggests that `arrow::read_parquet` may be a powerful tool for data I/O in R when only a subset of columns are required. 

