---
layout: post
title: "prep_prompt.sh"
date: 2025-03-04 19:05 -0800
---

While Github Copilot and Cline are integrated into the IDE and are excellent, sometimes I want a 3rd or 4th opinion.

My `prep_prompt.sh` prepares my code for pasting into the prompt. It doesn't do much but it's very helpful:

* It adds the name of the file before each file
* It adds code fence blocks (```) before and after the code
* It concatenates all the source files passed into it
* It copies it to the (macos) clipboard

## Usage:

* Basic usage:

<pre class="language-bash"><code>$ prep_prompt README.md app/controllers/application_controller.rb
Copied into clipboard.
</code></pre>

* The larger context sizes all the LLMs have been rolling out have been game changers, and this make sharing your entire app possible:

<pre class="language-bash"><code>$ prep_prompt $(find * | grep rb$)
Copied into clipboard.
</code></pre>

Now you can ask questions that require broader visibility of your entire app, instead of about individual files or snippets.

* The `--verbose` option shows what is being copied:

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