---
layout: post
title: Fire and consume custom global events in jQuery
tags:
- javascript
status: publish
type: post
published: true
meta:
  _edit_last: '357054'
  reddit: a:2:{s:5:"count";i:0;s:4:"time";i:1345289657;}
  delicious: a:3:{s:5:"count";i:0;s:9:"post_tags";s:0:"";s:4:"time";i:1345109755;}
---

* Update 3-4-2010: [jQuery 1.4 changed things a bit]({% post_url 2010-03-25-update-to-fire-and-consume-custom-global-events-in-jquery %})
* Update 9-8-2012: [Global events with Backbone JS]({% post_url 2012-09-08-global-events-as-a-message-bus-with-backbone-js %})

To bind something to a custom event:

``` javascript
$().bind("sneeze",function(){
  console.log("bless you!");
});
```

and to fire that event, from anywhere else?

``` javascript
$.event.trigger("sneeze");
```

result in the console, is as expected:

``` javascript
bless you
```


