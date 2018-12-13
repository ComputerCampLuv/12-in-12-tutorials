require 'test_helper'

class TodoItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get todo_items_create_url
    assert_response :success
  end

end
