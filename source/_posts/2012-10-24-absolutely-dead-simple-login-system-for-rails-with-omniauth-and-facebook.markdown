---
layout: post
title: "Absolutely dead simple login system for Rails with omniauth and facebook"
date: 2012-10-24 23:54
comments: true
categories: 
---
In 6 steps...
<!-- more -->

1) Add omniauth-facebook to your gemfile

``` ruby
gem 'omniauth-facebook'
```

2) Add routes for login and logout

``` ruby
match '/auth/facebook/callback' => 'session#create'
match '/auth/logout' => 'session#destroy'
```

3) Create the sessions controller

``` ruby
class SessionController < ApplicationController

  def create
    session[:current_user] = {:name => request.env['omniauth.auth'][:info][:name]}
    redirect_to root_path
  end

  def destroy
    session.delete(:current_user)
    redirect_to root_path
  end
end
```

4) Add some links to your layout

``` ruby
<% if current_user %>
  Logged in as <%=current_user[:name]%>
  <%= link_to 'logout','/auth/logout' %>
<% else %>
  <%= link_to 'login with facebook','/auth/facebook' %>
<% end %>
```

5) Add a helper to your application controller

``` ruby
class ApplicationController < ActionController::Base

  helper_method :current_user

  private

  def current_user
    session[:current_user]
  end
end
```

6) Add your facebook app keys in config/initializers/omniauth.rb, replacing ```<api key>``` and ```<api secret>``` with your actual keys:

``` ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '<api key>', '<api secret>'
end
```

Thats it!

You can replace omniauth-facebook with any other provider (such as omniauth-twitter) and it will work just as well. 
