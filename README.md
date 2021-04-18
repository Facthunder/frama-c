# Docker image for Frama-C

This project aims to provide a simple Docker image to encapsulate and run a [Frama-C](https://git.frama-c.com/pub/frama-c) analysis through Docker.

### Run Frama-C

#### Run core checks
Assuming current directory contains the source code to analyze, simply run the following command:
```Dockerfile
docker run --rm -v ${PWD}:/src facthunder/frama-c:latest -rte -eva *.c **/*.c > report.txt
```

### Versions matrix
Here is the versions matrix of the image:

|                          TAG                           |                       FRAMA-C VERSION                                 |                        BASE IMAGE                      |
|:------------------------------------------------------:|:---------------------------------------------------------------------:|:------------------------------------------------------:|
| [latest](https://hub.docker.com/r/facthunder/frama-c)  | [21.0](https://git.frama-c.com/pub/frama-c/-/releases/21.0)           |    [ubuntu:19.04](https://hub.docker.com/_/ubuntu)     |
|  [21.0](https://hub.docker.com/r/facthunder/frama-c)   | [21.0](https://git.frama-c.com/pub/frama-c/-/releases/21.0)           |    [ubuntu:19.04](https://hub.docker.com/_/ubuntu)     |
|  [20.0](https://hub.docker.com/r/facthunder/frama-c)   | [20.0](https://github.com/Frama-C/Frama-C-snapshot/releases/tag/20.0) |    [ubuntu:19.04](https://hub.docker.com/_/ubuntu)     |
|  [19.1](https://hub.docker.com/r/facthunder/frama-c)   | [19.1](https://github.com/Frama-C/Frama-C-snapshot/releases/tag/19.1) |    [ubuntu:19.04](https://hub.docker.com/_/ubuntu)     |


### How to contribute
If you experienced a problem with the plugin please open an issue. Inside this issue please explain us how to reproduce this issue and paste the log.

If you want to do a PR, please put inside of it the reason of this pull request. If this pull request fix an issue please insert the number of the issue or explain inside of the PR how to reproduce this issue.

### License
Copyright 2021 Facthunder.

Licensed under the [GNU General Public License, Version 3.0](https://www.gnu.org/licenses/gpl.txt)
