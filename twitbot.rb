require 'twitter'
require 'dotenv'
dotenv.load

# quelques lignes qui enregistrent les clés d'APIs
client = Twitter::Streaming::Client.new do |config|
 config.consumer_key        = env["TWITTER_API_KEY"]
  config.consumer_secret     = env["TWITTER_API_SECRET"]
  config.access_token        = env["TWITTER_ACCESS_TOKEN"]
  config.access_token_secret = env["TWITTER.ACCESS_TOKEN_SECRET"]
end
p client

topics = ["coffee", "tea"]
client.filter(track: topics.join(",")) do |object|
  puts object.text if object.is_a?(Twitter::Tweet)
end