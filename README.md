# Bazel Mystery

Can you solve the mystery of the missing Basil? 🌱

This project is inspired by [NUKnightLab/sql-mysteries](https://github.com/NUKnightLab/sql-mysteries), but instead aims to help with learning about the [Bazel](https://bazel.build/) build tool.

## Prerequisites

- [Bazelisk](https://github.com/bazelbuild/bazelisk) installed. This will dynamically use the required version of bazel defined in the `.bazelversion` file.

## The Case of the Missing Basil 🌱

### Overview

John is a basil farmer. Some of his basil has mysteriously went missing. Relevant authorities were informed and a crime scene report was written.

### Rules

- Try not to look into the `BUILD` files at all.
- Try to solve the case by only using bazel queries and this `README` file.

### Crime Scene Report

The crime scene report for this case is in a protected location. You can uncover it once. However, after that first time of seeing it, you'll need to use some workarounds to see it again. *This is because bazel is very good at caching things that have already been built, so they only need to be built once (until they change or the cache is invalidated)*.

To see the crime scene report for this case, build the following target:

```bash
bazel build crime_scene_report:missing_basil_089324
```

If you need to see it again, look at the `README.md` file in [crime_scene_report](/crime_scene_report/README.md) for details of how to do that.

## Packages

Each package (e.g. [crime_scene_report](/crime_scene_report) and [person](person)) contain a `README.md` file which explains how to interract with the targets contained in the package.

Having an entity relationship diagram for bazel packages seems strange, but it helps to describe the environment:

TODO: Entity relationship diagram..

## Hints

Discovering the dependencies and reverse dependencies of targets is an important part of solving the case. For example:

### Dependencies

```bash
bazel query 'deps(//person:john)' --noimplicit_deps
# Returns all of the things that John depends on.
# e.g. his car.

//car:74383
```

### Reverse Dependencies

```bash
bazel query 'rdeps(//..., //person:amy)'
# Returns all of the things that depend on Amy.
# e.g. an interview.

//interview:454235
```

## Checking Your Answer

You can test your answer in the following way:

```bash
bazel test solution --test_env guess=John
# Use test_env guess=your_guess to make a guess.
# If the test passes, your guess is correct.

//solution:solution  FAILED in 0.1s
```

In the above case, we're checking whether John took the missing basil. He didn't, he has plenty of basil already.

## Full Solution Walkthrough

If you'd like a walkthrough of how to solve the case, see [solution_walkthrough.md](/solution_walkthrough.md).
