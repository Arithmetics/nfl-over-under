require 'test_helper'

class PicksControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # endx

  def setup
    @pick = picks(:atlanta)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Pick.count' do
      post picks_path, params: { title: "Celtics Season Over Under",
                                 benchmark: 33.5,
                                 locked: false,
                                 super: true,
                                 selection: "over" }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Pick.count' do
      delete pick_path(@pick)
    end
    assert_redirected_to login_url
  end

end
