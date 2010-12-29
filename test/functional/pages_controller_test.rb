require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get results" do
    get :results
    assert_response :success
  end

  test "should get processing" do
    get :processing
    assert_response :success
  end

end
