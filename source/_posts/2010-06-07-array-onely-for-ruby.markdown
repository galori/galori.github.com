---
layout: post
title: array#onely for ruby
tags:
- ruby
status: publish
type: post
published: true
meta:
  _edit_last: '357054'
  jabber_published: '1275942430'
  _wp_old_slug: ''
  delicious: a:3:{s:5:"count";i:0;s:9:"post_tags";s:0:"";s:4:"time";i:1345018501;}
  reddit: a:2:{s:5:"count";i:0;s:4:"time";i:1345460739;}
---
How many times do you use <strong>some_array.first</strong> as a way to get at the one and only member of that array?

It always bugged me that this can be error prone - if the array has more than one component you'll never know about it, and the .first method isn't semantically describing what you are doing - grabbing the one and only member.

If you add this somewhere in lib/initializiers, you get the .only method

``` ruby
class Array
  def only
    raise "called Array only with array of length #{self.length}" if self.length > 1
    self.first
  end
end
```

which provides a more semantic description of what you're trying to do:

``` irb
> [].only
 => nil
> [1].only
 => 1
> [1,2,3].only
RuntimeError: called Array#only with array of length 3
```

**Update 4/15/2014**: As pointed out by [@adamwong246](https://twitter.com/adamwong246/status/430754524559462400) - "only" is already [in use by ActiveRecord](http://api.rubyonrails.org/classes/ActiveRecord/SpawnMethods.html#method-i-only). He suggests "onely!" which has a nice ring to it.
