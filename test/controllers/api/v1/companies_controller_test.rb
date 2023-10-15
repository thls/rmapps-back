require "test_helper"

class Api::V1::CompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_company = api_v1_companies(:one)
  end

  test "should get index" do
    get api_v1_companies_url, as: :json
    assert_response :success
  end

  test "should create api_v1_company" do
    assert_difference("Api::V1::Company.count") do
      post api_v1_companies_url, params: { api_v1_company: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_company" do
    get api_v1_company_url(@api_v1_company), as: :json
    assert_response :success
  end

  test "should update api_v1_company" do
    patch api_v1_company_url(@api_v1_company), params: { api_v1_company: {  } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_company" do
    assert_difference("Api::V1::Company.count", -1) do
      delete api_v1_company_url(@api_v1_company), as: :json
    end

    assert_response :no_content
  end
end
