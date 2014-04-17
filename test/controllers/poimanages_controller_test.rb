require 'test_helper'

class PoimanagesControllerTest < ActionController::TestCase
  setup do
    @poimanage = poimanages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:poimanages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create poimanage" do
    assert_difference('Poimanage.count') do
      post :create, poimanage: { description: @poimanage.description, latitude: @poimanage.latitude, longitude: @poimanage.longitude, title: @poimanage.title }
    end

    assert_redirected_to poimanage_path(assigns(:poimanage))
  end

  test "should show poimanage" do
    get :show, id: @poimanage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @poimanage
    assert_response :success
  end

  test "should update poimanage" do
    patch :update, id: @poimanage, poimanage: { description: @poimanage.description, latitude: @poimanage.latitude, longitude: @poimanage.longitude, title: @poimanage.title }
    assert_redirected_to poimanage_path(assigns(:poimanage))
  end

  test "should destroy poimanage" do
    assert_difference('Poimanage.count', -1) do
      delete :destroy, id: @poimanage
    end

    assert_redirected_to poimanages_path
  end
end
