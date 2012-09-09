---
layout: post
title: "From wordpress to octopress"
date: 2012-09-07 23:10
comments: true
categories: blog
---
Just moved my blog from wordpress.com to [Octopress](http://octopress.org/). Octopress runs atop [jekyll](http://jekyllrb.com/) to generate static files and can deploy to pretty much any hosting provider - but has special tools for hosting on [github pages](http://pages.github.com/) - where this blog is now hosted. First I looked at Jekyll on its own, but seems like it required too much manual configuration - whereas Octopress makes all the choices for you. You just need to make changes.

Blog posts are created by editing a text file locally using Textmate 1 in [markdown](http://daringfireball.net/projects/markdown/basics), generating the blog and deploying. The blog's filename implies the posting date, for example this posts file name is

    sources/_posts/2012-09-07-from-wordpress-to-octopress.markdown
    
and you also include what they call a YAML UpfrontMatter to the top of every post to include additional metadata. For example for this post:

``` yaml
---
layout: posta
title: "From wordpress to octopress"
date: 2012-09-07 23:10
comments: true
categories: 
---
```

So far I'm really happy with it. If you'd like to give it a whirl yourself, All the info you need is at [Octopress](http://octopress.org/). It's got a very vibrant community, which is always a good thing.