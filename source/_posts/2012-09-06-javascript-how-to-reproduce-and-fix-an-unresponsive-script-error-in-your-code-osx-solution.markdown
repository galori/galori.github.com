---
layout: post
title: ! 'Javascript: "Unresponsive script" error'
tags: []
status: publish
type: post
published: true
meta:
  _edit_last: '357054'
  jabber_published: '1347007158'
---

What it means:
--------------

Javasript code is running for longer than 10 seconds. Thats the limit on Firefox 15. Other browsers may vary, googling reveals Internet Explorer's limit is 5 million lines of code (!) and Chrome allows 30 seconds.

<!-- more -->

How to reproduce:
-----------------

Although I was getting this bug report from several people, I was unable to reproduce it, likely due to the fact that my dev machine is pretty beefy. In general, once I can reproduce a bug, fixing it is the easy part. Without reproducing it - you're Luke Skywalker, swinging a light saber blindfolded, but the force is not with you... :-/

To the rescue is this [script](http://hints.macworld.com/article.php?story=20110131001708255) from user *nissebanan* at hints.macworld.com. To use it, follow the instructions on that page. Next, find out the process ID (pid) of your firefox using Terminal:

``` bash Find your firefox PID
$ ps aux | grep firefox
gal 25829 7.4 3.3 3605600 140336 ?? S 11:57PM 0:55.51 /Applications/Firefox.app/Contents/MacOS/firefox -psn_0_38671583
gal 25954 1.5 0.0 2434892 540 s000 S+ 12:04AM 0:00.01 grep firefox
```

*25829* is the PID. 

Next, run nissebanan's script - when it prompts you, provide the PID, and values for sleep and for CPU time. I used 9 seconds of sleep for every 1 second of CPU. This is almost "unfair" since 10s of sleep would trigger this error without giving any code a chance to run - so you have to keep it under 10. Once the script is running - you are essentially starving your Firefox of CPU...you now should be able to reproduce the error.

Finding the culprit
-------------------

There is probably a better way to benchmark your code at this point - but I just went with simple: Start sticking console.log's at the beginning and end of each method, and watch the console. When the error pops up - you'll see which method was the last one to start and never finished - thats your culprit!

Fixing it
---------

If you can optimize your code and have it run faster, do that!

However, a quick (and sometimes the only) fix is to break up the code and have it run asynchronously. Typically - by wrapping a block of code with `setTimeout(function{},0)`. This will return control to the browser and allow it to "breath", and resets the script timeout counter.

For example, if the offending code loops over 1000 objects and does something to each object, you can defer the loop's body asynchronously:

``` javascript Code that triggers the Unresponsive Script error. ary is 1000 objects:

_.each(ary,function(obj){
  doSomething(obj);
});

```
if the above code takes 10ms per object, you'll hit this error. The fix:

``` javascript Code that doesn't trigger the error
_.each(ary,function(obj){
  setTimeout(function(){
    doSomething(obj);
  },0);
});
```

Any caveats?
============

One thing to watch out for...if you have code _after_ the loop, this change would cause it to actually execute before the async code. If thats a problem, you'll need a little bit more restructuring. You also may want to check out the [jQuery.async](http://mess.genezys.net/jquery/jquery.async.php) which can make some of this easier.
