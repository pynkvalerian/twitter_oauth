class TweetUser < ActiveRecord::Base
  has_many :tweets

  def fetch_tweets!
  	@tweets = $twitter_client.user_timeline(self.username)
  	if self.tweets.nil?
	  	@tweets.each do |tweet|
	  		self.tweets.create(text: tweet.text, text_created_at: tweet.created_at)
		end
	else
		self.tweets.delete_all
		@tweets.each do |tweet|
	  		self.tweets.create(text: tweet.text, text_created_at: tweet.created_at)
		end
	end
  end

  def tweets_stale?
  	now = DateTime.now
  	time_zone_diff = 8 * 60 * 60
  	fifteen_mins = 15 *60
  	time_difference = now.to_i - (self.tweets.first.created_at).to_i + time_zone_diff
  	return true if time_difference > fifteen_mins
  end

end
