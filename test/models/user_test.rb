require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "Valid user" do
    user = User.new({ name: 'Vidur Punj', email: 'vidur.punj@hotmail.com', password: 12345678 })
    assert user.valid?
  end

  test "invalid without name" do
    user = User.new({ email: 'vidur.punj@1hotmail.com', password: 12345678 })
    refute user.valid?
    assert_not_nil user.errors[:name]
  end

  test "invalid without email" do
    user = User.new({ name: 'Vidur Punj', password: 12345678 })
    refute user.valid?
    assert_not_nil user.errors[:email]
  end

  test "An user email fall in line with a reuler expression" do
    @user = User.new({ name: 'Vidur Punj', email: 'vidur.punj@email.com', password: 12345678 })
    assert_match /\S+@\S+\.\S+/, @user.email
  end

end
