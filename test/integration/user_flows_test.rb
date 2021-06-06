require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  fixtures :all
  include Devise::Test::IntegrationHelpers
  include Warden::Test::Helpers

  test 'TV Series: Redirect to the series page with flash message if no params' do
    @user = users(:vidur)
    sign_in(@user)
    post '/tv_series'
    assert_response :redirect
    assert_equal "Please provide a file to be uploaded !", flash[:alert]
  end

  test "TV Series: upload TV series data with params" do
    @user = users(:vidur)
    sign_in(@user)
    post '/tv_series', params: { file: fixture_file_upload('files/tv_series.csv','text/csv')}
    assert_response :redirect
    assert_equal "TV series uploaded!", flash[:notice]
  end

  test 'Reviews: Redirect to the series page with flash message if no params' do
    @user = users(:punj)
    sign_in(@user)
    post '/tv_seriel_comments'
    assert_response :redirect
    assert_equal "Please provide a file to be uploaded !", flash[:alert]
  end

  test "Reviews: upload data with params" do
    @user = users(:punj)
    sign_in(@user)
    post '/tv_seriel_comments', params: { file: fixture_file_upload('files/reviews.csv','text/csv')}
    assert_response :redirect
    assert_equal "TV series comment uploaded!", flash[:notice]
  end

  # Run it with syste
  # rails test:system test/integration/user_flows_test.rb
  test "Check if the TV series destroyed" do
    @user = users(:vidur)
    sign_in(@user)
    delete "/tv_series/#{TvSeriel.last.id}"
    assert_response :redirect
    assert_equal "TV series removed success!", flash[:notice]
  end
end

