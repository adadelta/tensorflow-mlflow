#!/usr/bin/env bash

# mlflow
mlflow experiments create -n base_experiments
mlflow server --backend-store-uri /mlflow/mlruns/ --default-artifact-root /mlflow/mlruns/ --host 0.0.0.0 &

# main
source /etc/bash.bashrc && jupyter notebook --notebook-dir=/mlflow/ --ip 0.0.0.0 --no-browser --allow-root