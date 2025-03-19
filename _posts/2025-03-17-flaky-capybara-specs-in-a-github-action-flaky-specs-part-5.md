---
layout: post
title: Flaky browser specs in a Github Action (Flaky Specs part 5)
date: 2025-03-17 12:57 -0700
---

The most "fun" flaky spec to debug is a flaky browser spec that only fails intermittently in CI. What now?

To debug these effectively:

1. Force your Github Action container to stay alive
2. Provide a way to SSH in 
3. Provide a way to see the actual browser and interact with it

### Capybara running over VNC in the Github Action container:

![vnc](assets/images/vnc.gif)

The above was setup using [my "ci_vnc" scripts](https://github.com/galori/ci_vnc/tree/main/scripts) that are designed to setup SSH+VNC on a Github Action on EC2.  I'm hoping to iterate on them and turn them into a reusable Github Actions Marketplace action.

That is the most secure method as it does not rely on any 3rd party service proxies like `upterm` or `ngrok`. 

If you are OK with relying on such services, [there is a more drop-in github action approach that relies on `ngrok`](https://github.com/airsquared/reverse-linux-vnc-github-actions).









