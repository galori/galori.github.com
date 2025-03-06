---
layout: post
title: Prep code for AI Prompt
date: 2025-03-04 19:05 -0800
---

While Github Copilot and Cline are integrated into the IDE are are excellent, sometimes I want a 3rd or 4th opinion.

I use this `prep_prompt.sh` script to prepare my code for pasting into the prompt. 

## Usage:

<pre class="language-bash"><code>$ prep_prompt README.md app/controllers/application_controller.rb
Copied into clipboard.
</code></pre>

The `--verbose` option shows you what is being copied:

<pre class="language-ruby"><code>$ prep_prompt README.md app/controllers/application_controller.rb --verbose
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
</code></pre>

To use, place this script anywhere in your path:

<pre class="language-bash code-block-copyable"><code>#!/bin/bash

verbose=false
files=()

# Process command-line arguments to separate files from options
for arg in "$@"; do
  if [ "$arg" = "--verbose" ]; then
    verbose=true
  else
    files+=("$arg")
  fi
done

if [ "${#files[@]}" -eq 0 ]; then
  echo "Please provide at least one file as an argument."
  exit 1
fi

included_git files=""
source=""

for file in "${files[@]}"; do
  if [ -f "$file" ]; then
    included_files+="* $file"$'\n'
    if file --mime "$file" | grep -q 'text\|json\|xml'; then
      source+=$'\n'"\`$file\`:"$'\n'
      source+=$'```\n'
      source+="$(cat "$file")"$'\n'
      source+=$'```\n'
    fi
  fi
done

prompt="Included files:\n\n$included_files\n$source"

if [ "$verbose" = true ]; then
  echo -e "$prompt"
fi
echo -e "$prompt" | pbcopy
echo "Copied into clipboard."
</code></pre>