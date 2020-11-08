# 1) choose base container
# generally use the most recent tag

# data science notebook
# https://hub.docker.com/repository/docker/ucsdets/datascience-notebook/tags
#ARG BASE_CONTAINER=ucsdets/rl-notebook:2020.4-stable

# scipy/machine learning (tensorflow)
# https://hub.docker.com/repository/docker/ucsdets/scipy-ml-notebook/tags
ARG BASE_CONTAINER=ucsdets/datascience-notebook:2020.2-stable

FROM $BASE_CONTAINER

LABEL maintainer="UC San Diego ITS/ETS <ets-consult@ucsd.edu>"

# 2) change to root to install packages
USER root

#Run -it --rm --gpus device=GPU-3a23c669-1f69-c64e-cf85-44e9b07e7a2a ubuntu nvidia-smi

#Run apt-get install nvidia-container-runtime

#RUN conda install -c anaconda tensorflow-gpu

RUN apt-get install -y aria2

RUN apt-get install -y nmap

RUN apt-get install traceroute

# 3) install packages
RUN pip install --no-cache-dir geopandas babypandas

# 4) change back to notebook user
COPY /run_jupyter.sh /
RUN chmod 755 /run_jupyter.sh
USER $NB_UID

# Override command to disable running jupyter notebook at launch
# CMD ["/bin/bash"]
