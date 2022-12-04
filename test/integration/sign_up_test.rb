require "test_helper"

class SignUpTest < ActionDispatch::IntegrationTest
  test "get sign up form and create user" do
    get "/signup"
    assert_response :success
    assert_difference "User.count", 1 do
      post users_path, params: { user: { username: "john", email: "john@rails.com", password: "password" } }
      assert_response :redirect
    end
  end
end
