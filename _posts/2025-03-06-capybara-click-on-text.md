---
layout: post
title: "Capybara click_on_text"
date: 2025-03-06 21:38 -0800
---

[Capybara](https://github.com/teamcapybara/capybara) is great. But it's also kind of "idealistic" in that it only wants to interact with the page in a way that conforms to perfectly formed semantic HTML. This does not always conform with the reality. Ideally this motivates improvements to the site structure, but in the meantime there is `click_on_text`. Capybara can assert based on text on the page, and it can click on buttons and links. But there is no way to click on any text on the page without resorting to the lower level helpers such as `find`, `all` and working directly with the `Capybara::Node` objects.

Usage:

```ruby
click_on_text 'More details'
```

It uses xpath to find the text on the page and click on it. 

Include it in `spec/rails_helper.rb`:

```ruby
require Rails.root.join('spec/support/click_on_text.rb')

RSpec.configure do |config|
  config.include ClickOnText, type: :system
end
```

And drop this in `spec/support/click_on_text.rb`:


```ruby
module ClickOnText

  def click_on_text(text)
    element = find_by_text(text)
    element.click
  end

  def find_by_text(text)
    xpath = ".//*[text()=#{escape_for_xpath(text)}]"
    find(:xpath, xpath)
  end

  # Yes, this is necessary. Xpath doesn't support escaping both single quotes and double
  # quotes in the same string so requires using `concat`.
  def escape_for_xpath(text)
    if text.include?("'") && text.include?('"')
      parts = text.split("'")
      concat_parts = parts.map { |part| "'#{part}'" }.join(", \"'\", ")
      "concat(#{concat_parts})"
    elsif text.include?("'")
      "\"#{text}\""
    else
      "'#{text}'"
    end
  end

end
```
