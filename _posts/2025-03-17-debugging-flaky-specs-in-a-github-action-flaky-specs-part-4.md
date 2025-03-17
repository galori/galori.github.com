---
layout: post
title: Debugging flaky specs in a Github Action (Flaky Specs, Part 4)
date: 2025-03-17 12:53 -0700
---

## Run your spec directly in CI / Github Action

If you are unable to reproduce the error locally - try running your spec directly in CI.  Github Actions and CI in general aren't designed to allow you to SSH into them, but you can still do that with a couple of changes:

1. Force it to stay "alive" 
2. Allow it to accept incoming connection with [upterm](https://upterm.dev/) or [ngrok](https://ngrok.com/) [^1]

### Upterm Github Action 

The [Upterm Github Action](https://github.com/marketplace/actions/debugging-with-ssh) does both of these things for you:

```yaml
- name: Setup upterm session
  uses: lhotari/action-upterm@v1
  if: failure()
  with:
    wait-timeout-minutes: 30
```

If your specs fail, this sets up upterm + tmux and provides an SSH connection string and force the container to stay alive for 30 minutes. To connect, watch your the build log untill you see:

```shell
=== F8S2LCNHYCL8S3WGMW72                                                                                                 
Command:                tmux new -s upterm -x 132 -y 43                                                                 
Force Command:          tmux attach -t upterm                                                                           
Host:                   ssh://uptermd.upterm.dev:22                                                                     
SSH Session:            ssh F8S2LCn..........<REDACTED>...............FsOjIyMjI=@uptermd.upterm.dev
```

Then you can connect by copying the `ssh` connection string, and run your tests directly on the Github Action container:

![upterm](assets/images/upterm.gif)

[^1]: Upterm & ngrok require proxying through an [uptermd](https://github.com/owenthereal/upterm/tree/master/cmd/uptermd) server or the ngrok equivalent, which is available for free. However if this is unacceptable you have other options:

1. For upterm, you can run your own uptermd
2. Configure Github Actions to run on your own containers (via AWS/EC2 or similar), then connect directly 
