class Tweet < ActiveRecord::Base
  belongs_to :tweet_user
end
