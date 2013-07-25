---
layout: post
title: "Firebug Lite on an iPad"
date: 2013-07-22 16:42
comments: true
categories: firebug javascript ipad
---

Firebug Lite works really well on an iPad. If you want a quick way to inspect any web page, here is how you install the Firebug Lite bookmarklet on mobile Safari on an iPad. (Or for that matter, any other mobile device)

<!--more-->
1. Bookmark this page. (Yes, THIS page. Thats the only way to create a new bookmark. Don't worry we're going to change it in the next step)</li>
2. Copy the bookmarklet javascript code in the text area below:
<textarea style='width: 665px; height: 43px; display: block;'>javascript:(function(){ var fb = document.createElement('script'); fb.type = 'text/javascript'; fb.src = 'https://getfirebug.com/firebug-lite.js#startOpened'; document.getElementsByTagName('body')[0].appendChild(fb); })();</textarea>
3. Go back to your bookmarks, tap the “Edit" button, and select the bookmark you created in Step 2. Tap the url field for that bookmark to edit it. Tap and hold and select all of the old url. Delete. Tap and hold and paste in the javascript.

<img src="/images/firebug_lite_ipad.png" style="border: none; box-shadow: none;">