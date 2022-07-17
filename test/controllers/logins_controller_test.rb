require "test_helper"

class LoginsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @login = logins(:one)
  end

  test "should get index" do
    get logins_url, as: :json
    assert_response :success
  end

  test "should create login" do
    assert_difference("Login.count") do
      post logins_url, params: { login: { name: @login.name, password: @login.password } }, as: :json
    end

    assert_response :created
  end

  test "should show login" do
    get login_url(@login), as: :json
    assert_response :success
  end

  test "should update login" do
    patch login_url(@login), params: { login: { name: @login.name, password: @login.password } }, as: :json
    assert_response :success
  end

  test "should destroy login" do
    assert_difference("Login.count", -1) do
      delete login_url(@login), as: :json
    end

    assert_response :no_content
  end
end
