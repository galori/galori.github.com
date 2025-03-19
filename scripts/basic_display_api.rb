require 'net/http'
require 'json'
require 'uri'

ACCESS_TOKEN = 'EAAHvYYbFLD8BO7TppEGtIv60gD3bqbeohXqfC4lS7fdvHyfGQWq76WyAGu1eFsgOKOsTYaJCHVHKvp0X66CJ5ZBp6E6UZBqPWZBMzaDWg5EZCW0lMIsWyVIDYsjmpZBiThZAedYnDD9MmryZA8PPr8ftzDYVDL9eM9rxZA4rQVhd7982eCchEDI7Op4ZD'

uri = URI("https://graph.instagram.com/me/media?fields=id,media_type,media_url,timestamp&access_token=#{ACCESS_TOKEN}&limit=10")
response = Net::HTTP.get(uri)
data = JSON.parse(response)

data['data'].each do |media|
  puts media['media_url'] if media['media_type'] == 'IMAGE'
end
