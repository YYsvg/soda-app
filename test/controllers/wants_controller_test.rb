require 'test_helper'

class WantsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wants_index_url
    assert_response :success
  end

  test "should get new" do
    get wants_new_url
    assert_response :success
  end

  test "should get show" do
    get wants_show_url
    assert_response :success
  end

  test "should get edit" do
    get wants_edit_url
    assert_response :success
  end

end
