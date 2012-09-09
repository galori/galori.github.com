---
layout: post
title: "Global events as a message bus with backbone js"
date: 2012-09-08 20:45
comments: true
categories: javascript backbonejs
---

In the past I leveraged jQuery's events to create a client side message bus in javascript. Triggering and subscribing to global events is a great way to decouple your javascript code and make it more flexible and maintainable. Enter backbone JS, which has even better built in support for events. An easy way to get started is to bolt on event support to your main global app object:

``` javascript
_.extend(app,Backbone.Events);
```

Now you can trigger and subscribe to arbitrary events on your app object. For example if the user can select a twitter stream and your page has various components that change accordingly based on the selected stream: When the stream is selected, trigger the event:

``` javascript
app.trigger('stream-selected',streamName);
```

Other parts of the code can listen to this event and do something:

``` javascript
app.on('stream-selected',handleStreamSelected);

handleStreamSelected: function(streamName) {
  // do something
}
```

I used this pattern extensively for this [Social Dashboard](http://events.current.com) project.