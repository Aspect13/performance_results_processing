#!/bin/bash

echo "Started"
#echo "Start python"
#python3 /app/results_collector.py &
echo "Start R"
Rscript /app/results_processor.R &
#echo "Start reporter"
#python3 /app/reporter.py &
