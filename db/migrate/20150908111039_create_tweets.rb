class CreateTweets < ActiveRecord::Migration
  def change
  	create_table :tweets do |t|
  		t.string :text
  		t.integer :text_id
  		t.integer :tweet_user_id
  		t.string :text_created_at
  		t.timestamps null: false
  	end
  end
end
