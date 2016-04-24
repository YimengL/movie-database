require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Home | Movie Database"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "Help | Movie Database"
  end
  
  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | Movie Database"
  end
  
end
