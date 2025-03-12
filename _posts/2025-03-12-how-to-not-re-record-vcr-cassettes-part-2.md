---
layout: post
title: How to not re-record VCR cassettes part 2
date: 2025-03-12 00:19 -0700
---

More ways to not re-record VCR cassettes when you test changes:

1. Surgically modify the cassette YAML file to match the changes.  Not ideal but works in a pinch.
2. When the test includes a series of HTTP requests and only one changed: manually remove that one `request:` key from the cassette YAML file, change your cassette options to `record: :new_episodes` and re-run the test.  It will only re-record the one you deleted.
3. If the problem stems from the sequence of HTTP requests changing, or from HTTP requests getting called multiple times try `allow_playback_repeats: true`.
4. `allow_unused_http_interactions` defaults to `true` but in case its set to `false` in your test, changing it back to `true` might save you.

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