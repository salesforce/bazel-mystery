# Crime Scene Reports

You can query all crime scene reports by using:
```
bazel query crime_scene_reports/...
...
//crime_scene_reports:car_accident_275573
//crime_scene_reports:eaten_sandwich_738682
//crime_scene_reports:lost_dog_847941
...
```

This will return a list of crime scene report targets.

Crime scene reports are difficult to get your hands on. You can easily read them once, but if you want to see them again, you'll need to dig a little deeper to find it..

## Viewing crime scene reports more than once

The first time you want to see a crime scene, you just need to build the target e.g.

```
bazel build //crime_scene_reports:eaten_sandwich_738682
```

Crime scene reports use a bazel build target called `genrule`. These targets are used to generate files. Crime scene report build targets print the report & then write it to a file. Bazel is very good at caching build artifacts so it only really needs to perform the operation the first time, unless the cache is invalidated.

If you'd like to view a crime scene report again, you can do that by:

- invalidating the cache (e.g. `bazel clean`) & re-building the target to see the report;
- looking inside `bazel-bin`/`bazel-out` directory for the output of building the report.
