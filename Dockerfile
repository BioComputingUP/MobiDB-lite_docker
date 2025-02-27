FROM python:3.12-slim

WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y --no-install-recommends \
    git && \
    apt-get clean  && \
    apt-get autoremove

RUN git clone https://github.com/BioComputingUP/MobiDB-lite.git && \
    mv ./MobiDB-lite/* ./ && \
    rm -r ./MobiDB-lite

ENV PYTHONPATH=/usr/src/app/src

RUN pip install scikit-learn==1.4.2 numba==0.59.1 pandas==2.1.3 numpy==1.26.2

ENTRYPOINT ["python3","src/mobidb_lite/__main__.py"]
