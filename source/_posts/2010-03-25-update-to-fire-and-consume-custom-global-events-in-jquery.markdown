---
layout: post
title: Update to "Fire and consume custom global events in jQuery"
tags:
- javascript
status: publish
type: post
published: true
meta:
  _edit_last: '357054'
  delicious: a:3:{s:5:"count";i:0;s:9:"post_tags";s:0:"";s:4:"time";i:1345287815;}
  reddit: a:2:{s:5:"count";i:0;s:4:"time";i:1344583018;}
---
Update 9-8-2012: [Global events with Backbone JS]({% post_url 2012-09-08-global-events-as-a-message-bus-with-backbone-js %})

This is an update to [a previous post]({% post_url 2009-11-06-fire-and-consume-custom-global-events-in-jquery %})

jQuery 1.4 is out, and the undocumented syntax I described for triggering and responding to global events has changed. You can still use the same pattern. When firing a global event, bind to any element on the DOM, such as 'body' or document:

``` javascript
$(document).bind("sneeze",function(){})
$.event.trigger("sneeze");
```

This is a great way to decouple code and when used like a messaging system, can really clean up your code.
