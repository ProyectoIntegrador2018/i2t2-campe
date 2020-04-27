require 'test_helper'

class CurriculumsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get curriculums_new_url
    assert_response :success
  end

  test "should get create" do
    get curriculums_create_url
    assert_response :success
  end

  test "should get update" do
    get curriculums_update_url
    assert_response :success
  end

  test "should get edit" do
    get curriculums_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get curriculums_destroy_url
    assert_response :success
  end

  test "should get index" do
    get curriculums_index_url
    assert_response :success
  end

  test "should get show" do
    get curriculums_show_url
    assert_response :success
  end

end
