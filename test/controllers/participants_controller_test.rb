require 'test_helper'

class ParticipantsControllerTest < ActionController::TestCase
  setup do
    @participant = participants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:participants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create participant" do
    assert_difference('Participant.count') do
      post :create, participant: { description: @participant.description, email: @participant.email, event_id: @participant.event_id, is_guest: @participant.is_guest, is_paid: @participant.is_paid, name: @participant.name, skype: @participant.skype, surname: @participant.surname }
    end

    assert_redirected_to participant_path(assigns(:participant))
  end

  test "should show participant" do
    get :show, id: @participant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @participant
    assert_response :success
  end

  test "should update participant" do
    patch :update, id: @participant, participant: { description: @participant.description, email: @participant.email, event_id: @participant.event_id, is_guest: @participant.is_guest, is_paid: @participant.is_paid, name: @participant.name, skype: @participant.skype, surname: @participant.surname }
    assert_redirected_to participant_path(assigns(:participant))
  end

  test "should destroy participant" do
    assert_difference('Participant.count', -1) do
      delete :destroy, id: @participant
    end

    assert_redirected_to participants_path
  end
end
