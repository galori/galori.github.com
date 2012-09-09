---
layout: post
title: I heart git
tags:
- git
- version control
status: publish
type: post
published: true
meta:
  _edit_last: '357054'
  jabber_published: '1307263213'
  delicious: a:3:{s:5:"count";i:0;s:9:"post_tags";s:0:"";s:4:"time";i:1344932227;}
  reddit: a:2:{s:5:"count";i:0;s:4:"time";i:1345826909;}
---
Therefore, here are some of my favorite, useful git commands:

Diff of a Diff
--------------

Looking at the diff representing one commit is old news.


``` bash
git show <SHA>
```

Comparing a single file between two commits (or branches) is also not uncommon:

``` bash
git diff branch1 branch2 -- path/to/filename.ext
```

However - if the files were pretty far in the two branches to begin with - and you'd just like to compare the CHANGES introduced by two commits (a diff of a diff), one way is this:

``` bash
diff <(git show SHA)  <(git show SHA)
```

git log with diffs
------------------

Oft overlooked feature:

``` bash
git log -u
```

Can be useful if you'd like to track the history of a certain file, and view all the changes:

``` bash
git log -u -- path/to/filename.ext
```

git log, tracking renames
-------------------------

By default - viewing the history of a specific file with git log only goes as far back as when the file was created - or renamed.

If you'd like to track it back past any number of renames / moves:

``` bash
git log -u --follow -- path/to/filename.ext
```

This can get pretty slow for larger repos, which I imagine is why its not on by default.

View a file in a branch, without actually checking it out
---------------------------------------------------------

If you're working on a file and wish to view that same file in another branch, you can avoid extra stashes & checkouts and just "peek" into that branch:

``` bash
git show branch2:path/to/filename.ext
```

Note the syntax of branch:file without spaces, which is unusual.

Recommit a commit?
------------------

You may want to do this if the commit message is really bad (what are some of the worst messages you've seen? A whole other blog post...) and it's already been pushed remotely.

Git doesn't like letting you do this, you can't commit changes to files that haven't been changed. You can't cherry-pick a commit if all the changes are already in place. You could do a revert and then a re-revert - but semantically that might even be worse in the history - it implies there was a problem with the code.

Another approach:  Branch, amend, merge

``` bash
git checkout master
git checkout -b tmp_branch
git commit --amend
git checkout master
git merge tmp_branch
git delete -D tmp_branch
```

you'll end up with a duplicate commit, and a merge commit - but it gives you the opportunity to provide more verbose info on that 2nd commit message. In this example the commit in question would be at the tip of master, but any commit in history should work - just branch your tmp_branch off of whichever commit needs amending.

Common Ancestor
---------------

``` bash
git merge-base branch1 branch2
```

Shows you the one shared commit where these two branches diverged. In the git "file system", any two commits - no matter on which branch will have a shared ancestors. It's sort of like evolution.

This can be useful if you're in the middle of resolving a merge conflict, and you feel like the 3 pane diff GUI is not providing you with enough information.  Open up a 2nd terminal, find the common ancestor and then diff the file in question between the branch and the common ancestor, to see exactly whats changed.

List of commits that exist in one branch but not in another
-----------------------------------------------------------

I like this syntax because it reads well to me as a developer. Show me commits that are in branch1 that are not in branch2:

``` bash
git log branch1 ^branch2
```

If you or your group does a lot of cherry-picking or rebasing, then this won't always work - because those operations create a new SHA - and the above depend on the SHA being the same.  Start using merges instead if possible, then the usefulness of the above will become apparent.

You can use similar syntax to determine if a single commit is part of a branch or not:

``` bash
git log -n1 commit ^branch
```

If the commit is part of the branch, it will show you nothing. If it is not part of the branch...it will show you the commit.

Make an exiting branch tracking
-------------------------------

If a branch was started locally and was then pushed remotely. You probably found out soon enough that its not set up to track so well - compared to a branch that started remotely. To get it all set up:

``` bash
git branch --set-upstream foo upstream/foo
```

(Thanks to [this](http://stackoverflow.com/questions/520650/how-do-you-make-an-existing-git-branch-track-a-remote-branch) stackoverflow.com article for this last one)


