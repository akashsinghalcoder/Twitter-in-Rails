class User < ActiveRecord::Base
	has_many :tweets
	has_many :likes
	  has_many :follower_mappings, class_name: 'FollowMapping', foreign_key: 'followee_id'
   has_many :followee_mappings, class_name: 'FollowMapping', foreign_key: 'follower_id'
  
end
