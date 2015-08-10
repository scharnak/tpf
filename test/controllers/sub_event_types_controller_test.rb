require 'test_helper'

class SubEventTypesControllerTest < ActionController::TestCase
  setup do
    @sub_event_type = sub_event_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sub_event_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sub_event_type" do
    assert_difference('SubEventType.count') do
      post :create, sub_event_type: { description: @sub_event_type.description, name: @sub_event_type.name }
    end

    assert_redirected_to sub_event_type_path(assigns(:sub_event_type))
  end

  test "should show sub_event_type" do
    get :show, id: @sub_event_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sub_event_type
    assert_response :success
  end

  test "should update sub_event_type" do
    patch :update, id: @sub_event_type, sub_event_type: { description: @sub_event_type.description, name: @sub_event_type.name }
    assert_redirected_to sub_event_type_path(assigns(:sub_event_type))
  end

  test "should destroy sub_event_type" do
    assert_difference('SubEventType.count', -1) do
      delete :destroy, id: @sub_event_type
    end

    assert_redirected_to sub_event_types_path
  end
end
