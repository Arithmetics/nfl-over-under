require 'test_helper'

class BetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:michael)
    @bet = Bet.new(title: "Philadelphia 76ers", benchmark: 45.4, locked: false)
  end

  test "should be valid" do
    assert @bet.valid?
  end

  test "should have a title" do
    @bet.title = ""
    assert_not @bet.valid?
  end

  test "should have a benchmark" do
    @bet.benchmark = nil
    assert_not @bet.valid?
  end

  test "associated user picks should be destroyed when bet is gone" do
    @bet.save
    @bet.picks.create!(title: "Celtics over under",
                              benchmark: 53.5,
                              locked: false,
                              super: false,
                              user_id: @user.id,
                              selection: "over")
    assert_difference 'Pick.count', -1 do
      @bet.destroy
    end
  end




end
