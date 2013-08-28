client = Twitter::Client.new(
  :consumer_key => "#{ENV['TWITTER_CONSUMER_KEY']}",
  :consumer_secret => "#{ENV['TWITTER_CONSUMER_SECRET']}",
  :oauth_token => "#{ENV['TWITTER_ACCESS_TOKEN']}",
  :oauth_token_secret => "#{ENV['TTWITTER_TOKEN_SECRET']}"
)

