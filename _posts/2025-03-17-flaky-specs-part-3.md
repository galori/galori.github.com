---
layout: post
title: Flaky specs (part 3)
date: 2025-03-17 07:53 -0700
---

Sometimes specs only fail on CI, and pass locally.  The first thing to try is running the test suite locally in the same order locally:

Look for `Randomized with seed 14427` in your CI test run output. Grab the seed and then run the test suite locally with it:

```shell
bundle exec rspec --seed 14427
```