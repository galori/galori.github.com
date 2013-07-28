---
layout: post
title: "Git tips: Count # of commits between two commits"
date: 2013-07-27 21:30
comments: true
categories: git
---
Get # of commits between 2 commits (a.k.a between to SHA's):

``` bash
git log [first]..[second] --pretty=oneline | wc -l
```

[first] and [second] can be SHA's, branches or tags.

(via [gitTip Twitter account](https://twitter.com/GitHints/status/220223510491037696))