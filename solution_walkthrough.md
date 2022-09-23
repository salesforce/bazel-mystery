# Solution Walkthrough

This document explains how the correct answer can be discovered. Only read on if you want to spoil the surprise..

## Read the Crime Scene Report: 

```
bazel build crime_scene_reports:missing_basil_089324

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
bazel query people/...
//people:amy
//people:basil
//people:john
//people:katie
//people:mark
```

## Find out what targets depend on the two witnesses (Amy & Mark):

```
bazel query 'rdeps(//..., (//people:mark union //people:amy))'
//interviews:454235
//interviews:565673
```

This tells us that there were two interviews and gives us the targets for these interviews.

## Learn about the interviews:

```
bazel run //interviews:454235

I saw someone getting into a red car with some basil and they drove away without paying for it.
```

```
bazel run //interviews:565673

I saw a tall person running quickly to their car with some basil.
```

This tells us that the culprit was a tall person with a red car.

## Query for all of the red cars:

```
bazel query 'attr(tags, "red", //cars/...)'
//cars:23245
//cars:85465
```

This tells us that there are two red cars.

## Query to see who depends on the first red car:

```
bazel query 'rdeps(//..., //cars:23245)'
...
//people:basil
```

This tells us that a person called Basil owns the first red car.

## Query to see who depends on the second red car:

```
bazel query 'rdeps(//..., //cars:85465)'
...
//people:katie
```

This tells us that a person called Katie owns the second red car.

## Query to see whether Basil or Katie are tall

```
bazel query 'attr(tags, "tall", (//people:basil union //people:katie))'
//people:basil
```

This tells that Basil is tall. We already know that he has a red car.

## Check if Basil is the correct answer.

```
bazel test solution --test_env guess=basil
...
//solution:solution  PASSED in 0.1s
```

The mystery of the stolen basil has been solved! It was Basil.
