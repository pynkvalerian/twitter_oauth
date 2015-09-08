class TweetUser < ActiveRecord::Base
  has_many :tweets

  def fetch_tweets!
  	@tweets = $twitter_client.user_timeline(self.username)
  	@tweets.each do |tweet|
  		self.tweets.create(text: tweet.text, text_created_at: tweet.created_at)
  	end
  end

end
