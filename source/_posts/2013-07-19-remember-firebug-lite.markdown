---
layout: post
title: "Remember Firebug Lite?"
date: 2013-07-19 14:37
comments: true
categories: javascript firebuglite
---

**Interested in contributing to an open source project but don't know where to start?**

I've recently taken over maintaining the Firebug Lite open source project, after it has been abandoned & dormant for 2 years. I have a great fondness for this little bookmarklet that wont stop giving, it has saved me countless times over the years.

I believe it still has some great potential and uses, especially for mobile devices; and of course its always a life saver for older browsers.

If you are interested in pitching in, you could help with Firebug Lit'es web page, the build process, the issues list or the codebase itself.

<!-- more -->

_Firebug Lite's web site_

* Overhauling the "Install Firebug Lite" page, including adding an iPad / mobile installation instructions page for the bookmarklet, but also overall simplifying it the whole page. (Also its got mad Javascript errors right now - probably doesn't need 90% of the javascript on that page.)
* Migrating all open issues from Google Code to Github (there are some scripts for this). I already migrate the code.
* Cleaning up the issues list - are they still relevant, reproduce-able, are they solvable? Perhaps even comment and communicate with the submitter.
* Adding Google Analytics event tracking code and server side tracking so we can understand how people are using the bookmarklet.

_Build related_

* Some "forensic analysis" to reconstruct the build process. I found some remnants of what may have been an ANT script...but the actual script is nowhere to be found (Just like the guy that used to maintain this project). Mainly involves concatenting and then minifying many javascript files and then pushing them to the web site. (Rake, anyone?)

_Dev Related_

* Once we figure out the build process...I do have a patch ready to go for one of the outstanding bugs - lets do a new point release! The community will rejoice! (Or at least the 1 guy that submitted it)
* Attempt to tackle any of the open issues
* Make it work sanely on an iphone/android phone
* The top voted issue is actually a security limitation; Where the CSS can not be read if it is being served from a different hostname. More and more common these days with CDN's, etc. Firebug Lite without the CSS rules is kind of useless! A proposed workaround is the classic cross domain ajax fallback - use a server side proxy. Could work - just needs to be implemented.
* This project is based on the regular Firebug plugin extension and its libraries. We should try to bring in some of the newer featuers that make sense.
* We would kind-of have free reign to modernize this project to keep it relevant. Another idea I had was to provide an automatic proxy for mobile devices, so you would just visit http://getfirebug.com/lite/www.yoursite.com it would just serve your site with the firebug javascript injected - no clunky installing of bookmarks needed.

Anyway, if you're interested, reply here, or post to the Firebug Working Group google group, or you can email me at gal (at) steinitz (dot) com.

