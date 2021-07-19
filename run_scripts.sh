#!/bin/bash

# Generate data
Rscript generate_data.R >& logs/generate_data.log

# Run benchmarks
Rscript benchmark.R >& logs/benchmark.log
