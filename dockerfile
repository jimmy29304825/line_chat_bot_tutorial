FROM jupyter/datascience-notebook
RUN pip install Flask==0.12 requests line-bot-sdk
RUN pip install --upgrade pip
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda2-4.5.11-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b && \
    rm ~/miniconda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc
RUN echo "conda activate base" >> ~/.bashrc
RUN conda install python=3.7
RUN conda install -c anaconda pyodbc
