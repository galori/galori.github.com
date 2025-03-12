---
layout: post
title: How to not re-record VCR cassettes (part 1)
date: 2025-03-11 23:17 -0700
---

Sometimes when you make some small changes to a test that uses [VCR](https://github.com/vcr/vcr) the existing VCR recording varies just enough so that VCR insists that you re-record the VCR cassette, with the dreaded "VCR does not not know how to handle" error message. If rerecording the cassette requires a lot of setup, it's useful to have a few workarounds to avoid this. 

One way to do this is to modify the `match_requests_on` cassette option. By default VCR matches on `:method` and `:uri`.  Customize this with:

<pre class="language-shell"><code>describe "my test", vcr: { record: :new_episodes, match_requests_on: [:method, :path] } do

end
</code></pre>

The example above changes `:uri` to `:path`, which could be a valid thing to do if the hostname changed a bit but the path did not. As long as you determine that the test is still valid (and valuable) without being strict about the hostname this change will prevent the need to re-record.  THe possible values are:

`:body`, `:uri`, `:headers`, `:host`, `:method`, `:path`, `:query` and `:uri`












