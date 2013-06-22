require 'twitter'


#### Get your twitter keys & secrets:
#### https://dev.twitter.com/docs/auth/tokens-devtwittercom
Twitter.configure do |config|
  config.consumer_key = 'rs1Q5tiwJZzfC8R97w6iA'
  config.consumer_secret = 'b5LM3Uwj5YQ283a3XS3aF7nNw3minPIrpPnDAHY0E'
  config.oauth_token = '138869578-xnE5cMJGlW7JK1zoccfkNFUGvYBXeLNM6Zy9A1pr'
  config.oauth_token_secret = 'afxt4x2fqaPPmwxYigJNrt3Hsf76ChdVrKqw6l3yjUE'
end

search_term = URI::encode('#LM24')

SCHEDULER.every '10m', :first_in => 0 do |job|
  begin
    tweets = Twitter.search("#{search_term}").results

    if tweets
      tweets.map! do |tweet|
        { name: tweet.user.name, body: tweet.text, avatar: tweet.user.profile_image_url_https }
      end
      send_event('twitter_mentions', comments: tweets)
    end
  rescue Twitter::Error => e
    puts e.message
    puts "\e[33mFor the twitter widget to work, you need to put in your twitter API keys in the jobs/twitter.rb file.\e[0m"
  end
end