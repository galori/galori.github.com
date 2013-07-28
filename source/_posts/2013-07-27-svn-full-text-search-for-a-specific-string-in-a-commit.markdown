---
layout: post
title: "SVN: Full text search for a specific string in a commit"
date: 2013-07-27 21:33
comments: true
categories: git svn
---
As a long time git user, I expected it to be easy to do a full text search in SVN for a specific string in all commits. Apparently, it is not! However...fret not git users! Since we're all so much more used to using Git, you might as well use the git-svn gateway for the project.

<!--more-->

This will allow you to use all the git commands you're used to, while actually pushing to an svn remote. It's bidirectional, and you can keep working this way indefinitely - while the rest of your team mates will continue to use SVN and will not be the wiser! Whats more - you now have the advantage of a distributed source control system, while not actually using one. You can commit your code locally to your hearts content and only push it to the remote when you're ready.

First, clone the repo into a new folder:

``` bash
git svn clone http://path/to/your/svn/repo
```

Next, use the built in git -S option to do a full text search. This will show you every commit where this string was added or removed from any file. The -u option makes it so that the full diff of each commit is displayed, and not just the commit message.

``` bash
git log -S"the-string-you-want-to-find" -u
```

The real answer? Start actually using git! [Git Crash Course for SVN Users](https://git.wiki.kernel.org/index.php/GitSvnCrashCourse)

