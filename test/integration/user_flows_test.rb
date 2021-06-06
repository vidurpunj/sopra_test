require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  fixtures :all
  include Devise::Test::IntegrationHelpers
  include Warden::Test::Helpers

  test 'Redirect to the series page with flash message if no params' do
    @user = users(:vidur)
    sign_in(@user)
    post '/tv_series'
    assert_response :redirect
    assert_equal "Please provide a file to be uploaded !", flash[:alert]
  end

  test "upload TV series data with params" do
    @user = users(:vidur)
    sign_in(@user)
    post '/tv_series', params: { file: fixture_file_upload('files/reviews.csv','text/csv')}
    assert_response :redirect
    assert_equal "TV series uploaded!", flash[:notice]
  end

end

