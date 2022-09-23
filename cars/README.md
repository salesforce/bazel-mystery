# Cars

## Querying All Cars

You can query all cars by using:
```
bazel query cars/...
...
//cars:23245
//cars:74383
//cars:85465
...
```

## Querying Cars by Tag

You can query for all cars that include a specific tag e.g. query for all blue cars:
```
bazel query 'attr(tags, "blue", cars/...)'
//cars:74383
```

## Querying for who owns a Car

You can query for who owns a car by getting the reverse dependencies of a car target. E.g.
```
bazel query 'rdeps(..., cars:74383)'
//people:john
```
