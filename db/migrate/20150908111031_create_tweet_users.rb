class CreateTweetUsers < ActiveRecord::Migration
  def change
  	create_table :tweet_users do |t|
  		t.string :username
  		t.timestamps null: false
  	end
  end
end
