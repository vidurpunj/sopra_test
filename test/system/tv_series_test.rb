require "application_system_test_case"

class TvSeriesTest < ApplicationSystemTestCase
  # driven_by :selenium, using: :headless_chrome
  include Devise::Test::IntegrationHelpers

  test "visiting the index" do
    @user = users(:vidur)
    sign_in(@user)
    visit tv_series_index_url
    assert_selector "h2", text: "List of TV series"
  end

  test "uploading without csv file for the TV Series" do
    @user = users(:vidur)
    sign_in(@user)
    visit tv_series_index_url
    click_button "Add Series"
    assert_selector "div.notifications", text: "Please provide a file to be uploaded !"
  end

  test "uploading with csv file for the TV Series" do
    @user = users(:vidur)
    sign_in(@user)
    visit tv_series_index_url
    # will attach file to whatever file input is triggered by the block
    page.attach_file("#{Rails.root.to_s}/test/fixtures/files/tv_series.csv") do
      page.find('#tv_series').click
    end
    click_button "Add Series"
    assert_selector "div.notifications", text: "TV series uploaded!"
  end

  test "uploading with csv file for the TV Series, reviews" do
    @user = users(:vidur)
    sign_in(@user)
    visit tv_series_index_url
    # will attach file to whatever file input is triggered by the block
    page.attach_file("#{Rails.root.to_s}/test/fixtures/files/reviews.csv") do
      page.find('#tv_series_comment').click
    end
    click_button "Add comments"
    assert_selector "div.notifications", text: "TV series comment uploaded!"
  end

end
