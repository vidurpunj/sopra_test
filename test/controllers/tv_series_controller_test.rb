require 'test_helper'

class TvSeriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tv_series_index_url
    assert_response :success
  end

end
