#!/bin/bash

echo "Started"

source /app/venv/activate
echo "Venv activated"
python -V

echo "Start results_collector"
python /app/results_collector.py &

echo "Start R"
Rscript /app/results_processor.R &

echo "Start reporter"
python /app/reporter.py &
