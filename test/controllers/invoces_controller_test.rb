require 'test_helper'

class InvocesControllerTest < ActionController::TestCase
  setup do
    @invoce = invoces(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invoces)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invoce" do
    assert_difference('Invoce.count') do
      post :create, invoce: { invoce_number: @invoce.invoce_number, invoced_company_id: @invoce.invoced_company_id, invocedate: @invoce.invocedate, order_type_id: @invoce.order_type_id, quantity: @invoce.quantity, shop: @invoce.shop }
    end

    assert_redirected_to invoce_path(assigns(:invoce))
  end

  test "should show invoce" do
    get :show, id: @invoce
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invoce
    assert_response :success
  end

  test "should update invoce" do
    patch :update, id: @invoce, invoce: { invoce_number: @invoce.invoce_number, invoced_company_id: @invoce.invoced_company_id, invocedate: @invoce.invocedate, order_type_id: @invoce.order_type_id, quantity: @invoce.quantity, shop: @invoce.shop }
    assert_redirected_to invoce_path(assigns(:invoce))
  end

  test "should destroy invoce" do
    assert_difference('Invoce.count', -1) do
      delete :destroy, id: @invoce
    end

    assert_redirected_to invoces_path
  end
end
