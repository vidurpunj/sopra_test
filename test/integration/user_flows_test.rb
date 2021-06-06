require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  fixtures :all
  include Devise::Test::IntegrationHelpers
  include Warden::Test::Helpers

  test 'Get list of all users' do
    @user = users(:vidur)
    sign_in(@user)
    get "/users"
    assert_response :success
    assert_select "h2", "User List"
  end

  test 'Update Series' do
    @user = users(:vidur)
    sign_in(@user)
    post "/tv_series"
    # params: { }
    assert_response :success
    assert_select "h2", "User List"
  end

end

