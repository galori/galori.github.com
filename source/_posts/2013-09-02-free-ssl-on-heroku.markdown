---
layout: post
title: "Free SSL on Heroku"
date: 2013-09-02 14:21
comments: true
categories: ssl hosting herou
---
This is probably old news to most readers, however it was news to me. You can get free SSL on heroku, by using whats known as "Piggyback SSL". For your sensitive pages (Login, Credit Card, etc.) redirect from your regular hostname to

```
https://your-app.herokuapp.com
```

then redirect back to your normal hostname using http://.

Of course, for only $20/mo you can use the SSL add-on and install your own certificate, and use

```
https://your-domain.com
```

...however for small and personal projects that really don't justify any recurring monthly cost, there is this.

