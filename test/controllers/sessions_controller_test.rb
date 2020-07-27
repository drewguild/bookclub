require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "POST create" do
    post sessions_path, params: { username: "username", password: "password1" }
    
    assert_response(:success)
  end
end