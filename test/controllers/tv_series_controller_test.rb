require 'test_helper'

class TvSeriesControllerTest < ActionDispatch::IntegrationTest
  fixtures :all
  include Devise::Test::IntegrationHelpers
  include Warden::Test::Helpers

  test "should get redirect response if user not login tv series" do
    get '/tv_series'
    assert_response :redirect
  end

  test "should get index of tv series" do
    @user = users(:vidur)
    sign_in(@user)
    get '/tv_series'
    assert_response :success
  end

end
