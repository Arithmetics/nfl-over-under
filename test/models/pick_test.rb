require 'test_helper'

class PickTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:michael)
    @bet = bets(:celtics)
    @pick = @user.picks.build(title: "Celtics over under",
                              benchmark: 53.5,
                              locked: false,
                              super: false,
                              bet_id: @bet.id,
                              selection: "over")
  end


  test "should be valid" do
    assert @pick.valid?
  end

  test "user id should be present" do
    @pick.user_id = nil
    assert_not @pick.valid?
  end

  test "bet id should be present" do
    @pick.bet_id = nil
    assert_not @pick.valid?
  end

  test "order should be most recent first" do
    assert_equal picks(:bulls), Pick.first
  end




end
