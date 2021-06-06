require 'test_helper'

class TvSerielTest < ActiveSupport::TestCase
  test "It should not save series with empty
           name, genre, director, actor" do
    tv_series = TvSeriel.new
    assert_not tv_series.save
  end


end
