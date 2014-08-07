require 'test_helper'

class InvocedCompaniesControllerTest < ActionController::TestCase
  setup do
    @invoced_company = invoced_companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invoced_companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invoced_company" do
    assert_difference('InvocedCompany.count') do
      post :create, invoced_company: { name: @invoced_company.name }
    end

    assert_redirected_to invoced_company_path(assigns(:invoced_company))
  end

  test "should show invoced_company" do
    get :show, id: @invoced_company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invoced_company
    assert_response :success
  end

  test "should update invoced_company" do
    patch :update, id: @invoced_company, invoced_company: { name: @invoced_company.name }
    assert_redirected_to invoced_company_path(assigns(:invoced_company))
  end

  test "should destroy invoced_company" do
    assert_difference('InvocedCompany.count', -1) do
      delete :destroy, id: @invoced_company
    end

    assert_redirected_to invoced_companies_path
  end
end
