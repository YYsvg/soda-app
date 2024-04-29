require 'test_helper'

class OutcomeCategoryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get outcome_category_index_url
    assert_response :success
  end

  test "should get new" do
    get outcome_category_new_url
    assert_response :success
  end

  test "should get edit" do
    get outcome_category_edit_url
    assert_response :success
  end

end
