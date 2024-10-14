FROM tensorflow/build:2.14-python3.9

RUN git clone --depth 1 --branch v2.14.0 https://github.com/tensorflow/tensorflow.git
WORKDIR tensorflow

COPY ./.tf_configure.bazelrc ./.tf_configure.bazelrc
