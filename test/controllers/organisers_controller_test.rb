require 'test_helper'

class OrganisersControllerTest < ActionController::TestCase
  setup do
    @organiser = organisers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:organisers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create organiser" do
    assert_difference('Organiser.count') do
      post :create, organiser: { description: @organiser.description, email: @organiser.email, event_id: @organiser.event_id, name: @organiser.name, skype: @organiser.skype, surname: @organiser.surname }
    end

    assert_redirected_to organiser_path(assigns(:organiser))
  end

  test "should show organiser" do
    get :show, id: @organiser
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @organiser
    assert_response :success
  end

  test "should update organiser" do
    patch :update, id: @organiser, organiser: { description: @organiser.description, email: @organiser.email, event_id: @organiser.event_id, name: @organiser.name, skype: @organiser.skype, surname: @organiser.surname }
    assert_redirected_to organiser_path(assigns(:organiser))
  end

  test "should destroy organiser" do
    assert_difference('Organiser.count', -1) do
      delete :destroy, id: @organiser
    end

    assert_redirected_to organisers_path
  end
end
