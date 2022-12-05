require "test_helper"

class Public::AddressControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_address_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_address_edit_url
    assert_response :success
  end

  test "should get create" do
    get public_address_create_url
    assert_response :success
  end

  test "should get update" do
    get public_address_update_url
    assert_response :success
  end

  test "should get destroy" do
    get public_address_destroy_url
    assert_response :success
  end
end
