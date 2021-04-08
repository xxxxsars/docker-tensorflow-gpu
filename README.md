**Step 1.**

pull this repository

```
$ git clone https://github.com/xxxxsars/docker-tensorflow-gpu.git
```

**Step 2.**

Install nvidia driver on Ubuntu

```
$ apt-get install  nvidia-driver-460
```
**Step 3.**

install nvidia docker 

```
$ distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
   && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
   && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
$ curl -s -L https://nvidia.github.io/nvidia-container-runtime/experimental/$distribution/nvidia-container-runtime.list | sudo tee /etc/apt/sources.list.d/nvidia-container-runtime.list
$ sudo apt-get update
$ sudo apt-get install -y nvidia-docker2
$ sudo systemctl restart docker

```

**Step 4.**

test gpu docker workable 
```
$ sudo docker run --rm --gpus all nvidia/cuda:11.0-base nvidia-smi
```

```
Thu Apr  8 02:07:52 2021       
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 460.32.03    Driver Version: 460.32.03    CUDA Version: 11.2     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|                               |                      |               MIG M. |
|===============================+======================+======================|
|   0  GeForce GTX 108...  On   | 00000000:01:00.0 Off |                  N/A |
| 89%   84C    P2   151W / 275W |   4513MiB / 11178MiB |    100%      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+
                                                                               
+-----------------------------------------------------------------------------+
| Processes:                                                                  |
|  GPU   GI   CI        PID   Type   Process name                  GPU Memory |
|        ID   ID                                                   Usage      |
|=============================================================================|
+-----------------------------------------------------------------------------+
```



**Step 5.**

building docker images

```
$ cd docker-tensorflow-gup
$ docker build -t tf_ssh:2.4.0-gpu
```


**Step 6.**

run this container

```
$ docker run -p 8022:22 -p 6006:6006 tf_ssh:2.4.0-gpu
```