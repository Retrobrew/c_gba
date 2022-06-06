# GBA C compiler in docker container

Add your project in ```/data``` folder container

## Build

```shell
docker build -t gba-c .
```

## Run

```shell
docker run -v (your C gba project):/data gba-c
```