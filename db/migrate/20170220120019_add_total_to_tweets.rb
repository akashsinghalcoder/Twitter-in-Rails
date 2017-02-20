class AddTotalToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :total, :integer, default: 0
  end
end
