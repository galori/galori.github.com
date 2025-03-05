---
layout: post
title: Prep code for AI Prompt
date: 2025-03-04 19:05 -0800
---

While Github Copilot and Cline are integrated into the IDE are are excellent, sometimes I want a 3rd or 4th opinion.

I use this `prep_prompt.sh` script to prepare my code for pasting into the prompt. 

## Usage:

```shell
$ prep_prompt README.md app/controllers/application_controller.rb
Copied into clipboard.
```

The `--verbose` option shows you what is being copied:

~~~shell
$ prep_prompt README.md app/controllers/application_controller.rb --verbose
Included files:

* README.md
* app/controllers/application_controller.rb


`README.md`:
```
# README

This README would normally document whatever steps are necessary to get the
application up and running.
```

`app/controllers/application_controller.rb`:
```
class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
end
```

Copied into clipboard.
~~~