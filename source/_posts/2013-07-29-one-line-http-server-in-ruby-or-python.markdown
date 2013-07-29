---
layout: post
title: "One line HTTP server in Ruby or Python"
date: 2013-07-29 16:53
comments: true
categories: ruby python webserver
---
If you need to quickly spin up a web server to just serve static files from your file system, here are two ways to do it:

Ruby
====
``` ruby
ruby -rwebrick -e'WEBrick::HTTPServer.new(:Port => 3000, :DocumentRoot => Dir.pwd).start'
```

Python
======
``` python
python -m SimpleHTTPServer
```