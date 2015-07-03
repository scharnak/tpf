require 'test_helper'

class VolunteerNotesControllerTest < ActionController::TestCase
  setup do
    @volunteer_note = volunteer_notes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:volunteer_notes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create volunteer_note" do
    assert_difference('VolunteerNote.count') do
      post :create, volunteer_note: { created_by_user_id: @volunteer_note.created_by_user_id, description: @volunteer_note.description, user_id: @volunteer_note.user_id }
    end

    assert_redirected_to volunteer_note_path(assigns(:volunteer_note))
  end

  test "should show volunteer_note" do
    get :show, id: @volunteer_note
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @volunteer_note
    assert_response :success
  end

  test "should update volunteer_note" do
    patch :update, id: @volunteer_note, volunteer_note: { created_by_user_id: @volunteer_note.created_by_user_id, description: @volunteer_note.description, user_id: @volunteer_note.user_id }
    assert_redirected_to volunteer_note_path(assigns(:volunteer_note))
  end

  test "should destroy volunteer_note" do
    assert_difference('VolunteerNote.count', -1) do
      delete :destroy, id: @volunteer_note
    end

    assert_redirected_to volunteer_notes_path
  end
end
