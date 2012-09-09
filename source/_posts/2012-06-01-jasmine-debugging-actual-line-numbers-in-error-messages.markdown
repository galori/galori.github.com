---
layout: post
title: "Jasmine Debugging: Actual line numbers in error messages"
tags: [javascript jasmine]
status: publish
type: post
published: true
meta:
  jabber_published: '1338525120'
  _edit_last: '357054'
  delicious: a:3:{s:5:"count";s:1:"0";s:9:"post_tags";s:0:"";s:4:"time";s:10:"1339463835";}
  reddit: a:2:{s:5:"count";s:1:"0";s:4:"time";s:10:"1338850524";}
---
If you're using Pivotal Labs' excellent [Jasmine](http://pivotal.github.com/jasmine/) javascript BDD testing framework you may run into this. With Rails 3 Asset Pipeline, jasmine concatenates your js files into a single file - and therefore the line numbers on your stack traces are not useful (they will show the concatenated line numbers). 

For example, you may see an error from the concatenated application.js line #17,403 instead of home.js line #15.  To get jasmine to reference the javascript files individually and thereby provide more informative error messages, add this in config/initializers/jasmine.rb:

``` ruby
module Jasmine
  class Config
    def src_files
      Rails.application.assets["application"].dependencies.map do |asset|
        "assets/" + asset.logical_path
      end
    end
  end
end
```

NOTE: This only works if your application.js requires all your javascript files and doesn't include any javascript itself.
