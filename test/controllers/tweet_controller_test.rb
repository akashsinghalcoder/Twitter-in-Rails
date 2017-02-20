require 'test_helper'

class TweetControllerTest < ActionController::TestCase
  test "should get content:string" do
    get :content:string
    assert_response :success
  end

  test "should get User:references" do
    get :User:references
    assert_response :success
  end

end
