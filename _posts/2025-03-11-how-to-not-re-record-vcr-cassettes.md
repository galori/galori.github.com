---
layout: post
title: How to not re-record VCR cassettes (part 1)
date: 2025-03-11 23:17 -0700
---

Sometimes when you make some small changes to a test that uses [VCR](https://github.com/vcr/vcr) the existing VCR recording varies just enough so that VCR insists that you re-record the VCR cassette, with the dreaded "VCR does not not know how to handle" error message. If rerecording the cassette requires a lot of setup, it's useful to have a few workarounds to avoid this. 

This will be a series of posts, and I'm going to start with the obvious ones.

The most straightforward way approach is to modify the `match_requests_on` cassette option. By default VCR matches on `:method` and `:uri`.  Customize this with:

<pre class="language-shell"><code>describe "my test", vcr: { record: :none, match_requests_on: [:method, :path] } do

end
</code></pre>

The example above changes `:uri` to `:path`, which could be a valid thing to do if the hostname changed a bit but the path did not. As long as you determine that the test is still valid (and valuable) without being strict about the hostname this change will prevent the need to re-record.  THe possible values are:

`:body`, `:uri`, `:headers`, `:host`, `:method`, `:path`, `:query`, `:uri`, `:body_as_json`.

Stay tuned for follow up posts with more involved approaches, custom matchers, hacks and workarounds!

<hr>
<br/>

<div style="display: flex">
<div style="width: 350px; margin-right: 2em;">
<img src="/assets/images/vcr_cassette.png" width="150px">
</div>
<div>
I help out with the VCR gem, but it can always use more maintainers. <br/><br/>

If you'd like to help maintain a well-used gem please spend some time <a href="https://github.com/vcr/vcr/pulls">reviewing pull requests</a>, issues, or participating in discussions. We're also always grateful for <a href="https://opencollective.com/vcr#sponsor"><img src="https://opencollective.com/vcr/sponsors/badge.svg?style=flat-square"></a>.  
</div>
</div>







