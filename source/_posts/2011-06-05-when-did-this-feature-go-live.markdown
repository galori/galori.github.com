---
layout: post
title: When did this feature go live? (starring git)
tags: []
status: publish
type: post
published: true
meta:
  jabber_published: '1307305831'
  _edit_last: '357054'
  delicious: a:3:{s:5:"count";i:0;s:9:"post_tags";s:0:"";s:4:"time";i:1345019742;}
  reddit: a:2:{s:5:"count";i:0;s:4:"time";i:1345021413;}
---
It can be very useful to be able to answer this question accurately.

To do this, add code to your deploy script that tags every production deploy with git. Example:

```
  timestamp = Time.now.strftime('%Y-%m-%d/at/%H.%M')
  tag_name = "deploy/#{timestamp}"
  `git tag #{tag_name}; git push origin #{tag_name}`
```

Now, if the question ever comes up when a particular feature went live, you can determine this down to the minute. Find a commit that was part of this feature. For example, a new header design:

```
   git log --grep="header"
```

Now you can use the *--contains* switch to find the earliest tag that contained this particular commit: 

```
   git tag --contains <SHA>
```

See [my previous post on git]({% post_url 2011-06-05-useful-lesser-known-git-commands %}) for more useful git commands.
