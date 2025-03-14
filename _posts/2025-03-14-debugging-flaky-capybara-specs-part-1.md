---
layout: post
title: Debugging flaky specs - part 1
date: 2025-03-14 13:06 -0700
---

Everyone's favorite topic: flaky specs. 

There is no one solution because it's not one problem. But for the most part flaky spec's root cause will always come down to _something_ introducing non-determinism.

Common root casues: 

* Specs can be run in a *random* order (which is a good thing). When one test leaks state, this can result in subsequent tests failing intermittently.
* SQL queries without an `order by` clause by definition do not guarantee order. The resulting data set will be in a *random* order and if a test relies on the order for it's assertion, that will fail intermittently.
* Browser tests (for example, using Capybara) can be notoriuos for flakiness. When using an actual running browser - we're dealing with multiple processes and threads even if our code does not use concurrency. Even just the complexity of the browser itself results in *non-deterministic* response times.

A good simple first step when attempting to troubleshoot a flaky spec is to see if it's flaky in isolation:

```bash
for _ in $(seq 1 to 100); do bundle exec rspec spec/system/login_spec.rb || break; end
```

The above runs the spec 100 times until it fails, and then stops.
