require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  fixtures :all
  include Devise::Test::IntegrationHelpers
  include Warden::Test::Helpers

  test "Should not save a comment without a user" do
    comment = Comment.new
    assert_not comment.save
  end

  test "Should shout not save an empty review" do
    comment = Comment.new({ review: '', stars: 5, user: users(:vidur) })
    assert_not comment.save
  end

  test "Should shout save with all fields correct such as review, stars, user and tv serial" do
    comment = Comment.new({ review: 'Some review', stars: 5, user: users(:vidur), tv_seriel: tv_seriels(:bad_boy) })
    assert comment.save
  end
end
