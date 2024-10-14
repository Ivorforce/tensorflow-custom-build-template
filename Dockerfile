FROM tensorflow/build:2.14-python3.9

RUN git clone --depth 1 --branch v2.14.0 https://github.com/tensorflow/tensorflow.git
WORKDIR tensorflow

COPY ./.tf_configure.bazelrc ./.tf_configure.bazelrc

# It is better to run these through `docker run -it custom-tensorflow-build`.
# RUN TF_PYTHON_VERSION=3.9 bazel build --config=release_cpu_linux --config=opt -j 8 //tensorflow/tools/pip_package:build_pip_package
# RUN ./bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg
