# Create public docker image of omicsBioAnalytics

### 1) [Install docker](https://docs.docker.com/get-docker/)
### 2) [Make docker account](https://hub.docker.com/signup)

* <_IMAGE_ID_> ()
* <_REPO_>/<_IMAGE_NAME_>:versionX.X (*e.g.* singha53/omics-bioanalytics:version0.1)

### 3) Clone repository

```bash
$ git clone https://github.com/singha53/udacity_capstone.git
$ cd udacity_capstone
```

### 4) Build docker image

```bash
$ docker build -t omics-bioanalytics .
```

### 5) Tag and push docker image

```bash
$ docker image ls
$ docker tag <_IMAGE_ID_> <REPO>/<_IMAGE_NAME_>:versionX.X
$ docker push <_REPO_>/<_IMAGE_NAME_>:versionX.X
```

## References
1) [Docker build](hhttps://docs.docker.com/engine/reference/commandline/build/)
2) [Docker tag](https://docs.docker.com/engine/reference/commandline/tag/)
3) [Docker push](https://docs.docker.com/engine/reference/commandline/push/)