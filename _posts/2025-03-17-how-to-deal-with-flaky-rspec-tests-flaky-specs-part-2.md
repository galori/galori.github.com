---
layout: post
title: How to deal with flaky rspec tests (flaky specs, part 2)
date: 2025-03-17 00:43 -0700
---

Leaving flaky specs in your tets suite may seem not very harmfull. It just requires developers to sometimes rerun the test suite, so what?

The thing is - besides just reducing overall developer productivity, you are also training yourself to ignore or not rely on the tests as much. This can be much more harmful.

Instead of letting flaky specs fester, take the following two steps immediately:

1. Mark all your flaky specs with a tag:

```ruby
describe "it works", :flaky do 
end 
```

2. Change your CI to skip the flaky specs by using the `--tag ~flaky` rspec option. In a Github Action that might look like this:

```yaml
  - name: Run tests
    id: rspec
    continue-on-error: true
    run: bundle exec rspec --tag ~flaky --format documentation --color
```

This immediately stops the bleeding. Now the team can work through all the flaky specs one at a time to attempt to fix them.

Bonus:  This allows you to run JUST the flaky specs in an attempt to reproduce the flakiness (more on that soon):

```shell
bundle exec rspec --tag flaky 
```

(`~` excludes flaky specs, no `~` limits it to _only_ flaky specs)


