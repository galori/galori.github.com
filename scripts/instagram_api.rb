require 'net/http'
require 'json'
require 'uri'

ACCESS_TOKEN = 'EAAHvYYbFLD8BO7TppEGtIv60gD3bqbeohXqfC4lS7fdvHyfGQWq76WyAGu1eFsgOKOsTYaJCHVHKvp0X66CJ5ZBp6E6UZBqPWZBMzaDWg5EZCW0lMIsWyVIDYsjmpZBiThZAedYnDD9MmryZA8PPr8ftzDYVDL9eM9rxZA4rQVhd7982eCchEDI7Op4ZD'
USER_NAME      = 'galori'

me_url = 'https://graph.instagram.com/me?fields=id&access_token=' + ACCESS_TOKEN
uri = URI(me_url)
response = Net::HTTP.get(uri)
puts response
data = JSON.parse(response)
user_id = data['id']

uri = URI("https://graph.instagram.com/#{user_id}/media?fields=id,media_type,media_url,timestamp&access_token=#{ACCESS_TOKEN}&limit=10")
response = Net::HTTP.get(uri)
puts response
data = JSON.parse(response)

data['data'].each do |media|
  if media['media_type'] == 'IMAGE'
    puts media['media_url']
  end
end