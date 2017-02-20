class HomeController < ApplicationController

before_action:authenticate_user  
 def index
 	followers=current_user.followee_mappings.all()
 	@tweets=[]
 	followers.each do |current|
  	@tweets << Tweet.includes(:user).where(user_id:current.followee_id)
  end
  @tweets << Tweet.includes(:user).where(user_id:current_user.id)
 end
 def createtweet
 	current_user.tweets.create(content:params[:content])
 	return redirect_to '/'
 end
 def liketweet

  	tweet_id = params[:tweet_id]
  	like = current_user.likes.where(tweet_id: tweet_id).first
  	if like 
  		like.destroy
       tweet=Tweet.find_by_id(tweet_id)
      tweet.total=tweet.total-1
      tweet.save
  	else
  		current_user.likes.create(tweet_id: tweet_id)
      tweet=Tweet.find_by_id(tweet_id)
      tweet.total=tweet.total+1
      tweet.save

  	end

     redirect_to '/'

 end
 def follow
 	followee=params[:followee_id]
 	user=User.find_by_id(followee)
 	temp=user.follower_mappings.where(follower_id: current_user.id).first
 	if temp
 		temp.destroy
 	else
 		user.follower_mappings.create(follower_id:current_user.id)
 	end
 	redirect_to '/'
 end
  
end
