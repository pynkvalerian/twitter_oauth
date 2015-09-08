get '/' do
  # Look in app/views/index.erb
  erb :index
end

# post '/tweets' do
# 	username = params[:username]
# 	redirect to("/#{username}")
# end

# get '/:username' do
# 	@user = TweetUser.find_or_create_by(username: params[:username])

# 	if @user.tweets.empty?
# 		@user.fetch_tweets!
# 	elsif @user.tweets_stale? && @user.not_ancient_tweeter?
# 		@user.fetch_tweets!
# 	end

# 	@tweets = @user.tweets.limit(10)
#  	erb :show
# end

post '/ajax_tweets' do
	@user = TweetUser.find_or_create_by(username: params["username"])

	if @user.tweets.empty?
		@user.fetch_tweets!
	elsif @user.tweets_stale? && @user.not_ancient_tweeter?
		@user.fetch_tweets!
	end

	tweets = @user.tweets.limit(10)
	tweets.to_json( :only => [:text, :text_created_at])

end