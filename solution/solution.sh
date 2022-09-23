#!/bin/bash

# Copyright (c) 2022, salesforce.com, inc.
# All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
# For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause

# run this test by passing in --test_env e.g.
# bazel test solution --test_env guess=john

if [[ $guess == basil || $guess == Basil ]]; then
  exit 0
fi

exit 1
