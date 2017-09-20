### Build a sovrin package using docker

```
./build-sovrin-docker.sh <path-to-sources> <version>
```
Built package is placed in a docker volume `sovrin-rpm-c7.3.1611`. 

### Build a sovrin package

```
./build-sovrin.sh <path to sources> <version> <output-path: default='.'>
```

Built package is placed in the `output-path` folder.
