FROM tensorflow/tensorflow:1.3.0-devel-gpu
WORKDIR /app
COPY requirements.txt requirements.txt
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libsm6 libxext6 libxrender-dev \
    make \
    && rm -rf /var/lib/apt/lists/*
RUN pip install -r requirements.txt
EXPOSE 8888 8888
CMD /bin/bash
# sudo docker run -it --runtime=nvidia -v $(pwd):/app/latent_3d_points -r 8888:8888 --rm 3dgan
# jupyter notebook --port 8888 --allow-root
# export PYTHONPATH=$PYTHONPATH:/app