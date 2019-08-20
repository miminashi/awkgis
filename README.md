# awkgis

Simple GIS tools implemented in awk

## BUILD

```sh
./build.sh
```

## USAGE

### calculate distance between 2 locations

```sh
grep -v '^#' < example/points.txt | grep -v '^$' | ./distance
```
