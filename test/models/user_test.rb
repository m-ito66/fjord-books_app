# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:alice)
    @another = users(:bob)
  end

  test '#name_or_email' do
    assert_equal 'alice@example.com', @user.name_or_email
    @user.name = 'alice'

    assert_equal 'alice', @user.name_or_email
  end

  test '#follow' do
    assert_not @user.following?(@another)
    @user.follow(@another)

    assert @user.following?(@another)
    assert @another.followed_by?(@user)
  end

  test '#unfollow' do
    @user.follow(@another)

    assert @user.following?(@another)

    @user.unfollow(@another)

    assert_not @user.following?(@another)
    assert_not @another.followed_by?(@user)
  end
end
