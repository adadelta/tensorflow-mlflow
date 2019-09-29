# Tensorflow GPU MLflow Jupyter Dockerfile

A Dockerfile defining a Docker image containing CUDA, Tensorflow 2 (GPU), Miniconda, MLflow and Jupyter Note.

## About
This Dockerfile borrows from various Dockerfiles (including some of the official Tensorflow Dockerfiles). Recommended for local development but not production.

## Requirements

1. Install [Docker](https://www.docker.com/).
2. Make sure you have an NVIDIA GPU and install [nvidia-docker](https://github.com/NVIDIA/nvidia-docker).

## Building

```bash
docker build -t <image_tag> .
```
Where **<image_tag>** is the tag you choose for this image.

## Running

```bash
docker run -it -p 8888:8888 -p 5000:5000 --runtime=nvidia --name <container_name> <image_tag>
```

Where **<container_name>** is the name for your container and  **<image_tag>** is the tag you choose for your image.

### Mapping volumes

You can also map volumes to */mlflow/mlruns*, */mlflow/projects* and */mlflow/notebooks*, e.g.

    -v /your/home/mlruns:/mlflow/mlruns

## Interfaces

### Jupyter Notebook
When you run the container you'll see a web address in the logs similar to this:

    http://127.0.0.1:8888/?token=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

Click it and the Jupyter Notebook interface will open in your browser.

### MLflow UI

You can access the MLflow though [http://localhost:5000](http://localhost:5000).

## Notes

In your notebooks, make sure you include this code snippet so you'll see your experiments in the MLflow UI:

```python
from mlflow.tracking import set_tracking_uri as uri
uri('http://localhost:5000')
```