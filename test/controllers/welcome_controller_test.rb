require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  fixtures :all
  include Devise::Test::IntegrationHelpers
  include Warden::Test::Helpers

  test "should not get index without login" do
    get '/'
    assert_response :redirect
  end

  test "should get index" do
    @user = users(:user_vic)
    sign_in(@user)
    get '/'
    assert_response :success
  end

end
