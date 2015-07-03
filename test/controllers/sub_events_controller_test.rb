require 'test_helper'

class SubEventsControllerTest < ActionController::TestCase
  setup do
    @sub_event = sub_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sub_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sub_event" do
    assert_difference('SubEvent.count') do
      post :create, sub_event: { community_num: @sub_event.community_num, event_id: @sub_event.event_id, intern_num: @sub_event.intern_num, name: @sub_event.name, staff_num: @sub_event.staff_num }
    end

    assert_redirected_to sub_event_path(assigns(:sub_event))
  end

  test "should show sub_event" do
    get :show, id: @sub_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sub_event
    assert_response :success
  end

  test "should update sub_event" do
    patch :update, id: @sub_event, sub_event: { community_num: @sub_event.community_num, event_id: @sub_event.event_id, intern_num: @sub_event.intern_num, name: @sub_event.name, staff_num: @sub_event.staff_num }
    assert_redirected_to sub_event_path(assigns(:sub_event))
  end

  test "should destroy sub_event" do
    assert_difference('SubEvent.count', -1) do
      delete :destroy, id: @sub_event
    end

    assert_redirected_to sub_events_path
  end
end
