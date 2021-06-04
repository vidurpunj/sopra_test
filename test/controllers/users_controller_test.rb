require 'test_helper'


class UsersControllerTest < ActionDispatch::IntegrationTest
  fixtures :all
  include Devise::Test::IntegrationHelpers
  include Warden::Test::Helpers

  test "get index of user, should redirect if user not login." do
    get '/users'
    assert_response :redirect
  end

  test "should get index of user" do
    @user = users(:punj)
    sign_in(@user)
    get '/tv_series'
    assert_response :success
  end

end
