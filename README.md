## Tensorflow Custom Build Template

I recently needed a custom build of tensorflow, and my research for custom builds led me to this simple setup.

### How to Use

First, install Docker. Make sure the `Dockerfile` and the below commands correspond to your desired build properties. Then, run:

```bash

docker build -t custom-tensorflow-build .
docker run -it custom-tensorflow-build
```

This will launch a terminal inside a docker container. In it, run:

```bash
TF_PYTHON_VERSION=3.9 bazel build --config=release_cpu_linux --config=opt -j 8 //tensorflow/tools/pip_package:build_pip_package
./bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg
```

This will create a wheel inside the container's folder `/tmp/tensorflow_pkg`. If the build fails, it is most likely due to insufficient RAM. You can allocate more RAM to the container in the Docker settings, or reduce the argument of `-j` to decrease RAM usage by the build command.

When complete, you can download the wheel file to your computer from outside the container:

```bash
docker cp custom-tensorflow-build:/tmp/tensorflow_pkg tensorflow_pkg
```

You should now find the binary on your home computer, in the repository under `tensorflow_pkg`. You can install it with pip, e.g.:

```bash
pip install tensorflow_pkg/tensorflow-2.14.0-cp39-cp39-linux_x86_64.whl
```
