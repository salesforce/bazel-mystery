# Solution Walkthrough

This document explains how the correct answer can be discovered. Only read on if you want to spoil the surprise..

## Read the Crime Scene Report: 

```
bazel build crime_scene_report:missing_basil_089324

***************
Confidential
***************

The basil was first discovered missing on 28th June 2022.
Two witnesses have came forward with relevant information.

Their names are Amy and Mark. Both witnesses have been interviewed.
```

This will tell you that there are 2 witnesses. Their names are Amy & Mark.

Crime scene reports are build targets (output isn't repeated if already cached). If you want to see the output again you'll need to run `bazel clean` first.

## List all people

```bash
bazel query person/...
//person:amy
//person:basil
//person:john
//person:katie
//person:mark
```

## Find out what targets depend on these witnesses:

```
bazel query 'rdeps(//..., (//person:mark union //person:amy))'
//interview:454235
//interview:565673
```

This tells us that there were two interviews and gives us the targets for these interviews.

## Learn about the interviews:

```
bazel run //interview:454235

I saw someone getting into a red car with some basil and they drove away without paying for it.
```

```
bazel run //interview:565673

I saw a tall person running quickly to their car with some basil.
```

This tells us that the culprit was a tall person with a red car.

## Query for all of the red cars:

```
bazel query 'attr(tags, "red", set(//car/...))'
//car:23245
//car:85465
```

This tells us that there are two red cars.

## Query to see who depends on the first car:

```
bazel query 'rdeps(//..., //car:23245)'
...
//person:basil
```

This tells us that a person called Basil owns the car.

## Query to see who depends on the second car:

```
bazel query 'rdeps(//..., //car:85465)'
...
//person:katie
```

This tells us that a person called Katie owns the car.

## Query to see whether Basil or Katie are tall

```
bazel query 'attr(tags, "tall", (//person:basil union //person:katie))'
//person:basil
```

This tells that Basil is tall. We already know that he has a red car.

## Check if Basil is the correct answer.

```
bazel test solution --test_env guess=basil
...
//solution:solution  PASSED in 0.1s
```

The mystery of the stolen basil has been solved! It was Basil.
