FROM xfeng/jupyter:gpu-8.0-cudnn6
MAINTAINER XiaoFeng Qi <seal.qi@foxmail.com>

ENV REFRESHED_AT 2017-12-06

# Clone MXNet repo and move into it
RUN cd /root && git clone --recursive https://github.com/apache/incubator-mxnet.git && \
  cd incubator-mxnet && \
  make -j $(nproc) USE_OPENCV=1 USE_BLAS=openblas USE_CUDA=1 USE_CUDA_PATH=/usr/local/cuda USE_CUDNN=1 && \
  cd python && python setup.py install

RUN apt-get install -y graphviz
RUN pip install graphviz
