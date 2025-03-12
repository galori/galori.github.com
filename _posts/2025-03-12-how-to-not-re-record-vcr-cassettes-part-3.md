---
layout: post
title: "How to not re-record VCR cassettes, part 3"
date: 2025-03-12 00:31 -0700
---

[Custom Matchers](https://benoittgt.github.io/vcr/#/request_matching/custom_matcher?id=register-and-use-a-custom-matcher) allow a lot of flexibility. For example for an app that deals with Reddit URLs, this matcher allows any variation of the reddit URL to match as long as the Post ID matches:

<pre><code class="language-shell code-block-copyable">module VCRHelpers
  reddit_url_normalizer = ->(request_1, request_2) {
    extract_reddit_id(request_1) == extract_reddit_id(request_2)
  }
end</code></pre>

(Bonus: Uses the neat Ruby lambda syntax)

Then to use it:

<pre><code class="language-shell code-block-copyable">describe 'my test', vcr: { match_requests_on: [ VCRHelpers::reddit_url_normalizer ] } do

}</code></pre>
