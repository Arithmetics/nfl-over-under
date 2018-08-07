require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  include ApplicationHelper

  def setup
    @user = users(:michael)
  end

  test "profile display" do
    log_in_as(@user)
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', full_title(@user.name)
    assert_select 'p', text: "Name: " +@user.name
    assert_match @user.picks.count.to_s, response.body
    @user.picks.each do |pick|
      assert_match pick.title, response.body
    end
  end
end
