require 'test_helper'

class PreferenceTypesControllerTest < ActionController::TestCase
  setup do
    @preference_type = preference_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:preference_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create preference_type" do
    assert_difference('PreferenceType.count') do
      post :create, preference_type: { name: @preference_type.name }
    end

    assert_redirected_to preference_type_path(assigns(:preference_type))
  end

  test "should show preference_type" do
    get :show, id: @preference_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @preference_type
    assert_response :success
  end

  test "should update preference_type" do
    patch :update, id: @preference_type, preference_type: { name: @preference_type.name }
    assert_redirected_to preference_type_path(assigns(:preference_type))
  end

  test "should destroy preference_type" do
    assert_difference('PreferenceType.count', -1) do
      delete :destroy, id: @preference_type
    end

    assert_redirected_to preference_types_path
  end
end
