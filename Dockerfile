FROM xfeng/tensorflow-gpu:1.0
MAINTAINER XiaoFeng Qi <seal.qi@foxmail.com>

RUN pip uninstall tensorflow

# Download and build TensorFlow.
WORKDIR /root
RUN git clone -b r0.8 --recursive --recurse-submodules https://github.com/tensorflow/tensorflow.git && \
    cd tensorflow && \
    git checkout r0.8
WORKDIR /root/tensorflow

# Configure the build for our CUDA configuration.
ENV CUDA_PATH /usr/local/cuda
ENV CUDA_TOOLKIT_PATH /usr/local/cuda
ENV CUDNN_INSTALL_PATH /usr/lib/x86_64-linux-gnu
ENV LD_LIBRARY_PATH /usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64
ENV TF_NEED_CUDA 1
ENV TF_CUDA_COMPUTE_CAPABILITIES=3.0,3.5,5.2

RUN ./configure && \
    bazel build -c opt --config=cuda tensorflow/tools/pip_package:build_pip_package && \
    bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/pip && \
    pip install --upgrade /tmp/pip/tensorflow-*.whl

# expose the default ports of jupyter,flask and tomcat
EXPOSE 8888
EXPOSE 5000
EXPOSE 8080

# Set a seperated workspace as working directory
WORKDIR /root/workspace
# Optionally expose the workspace to the host
VOLUME ["/root/workspace"]