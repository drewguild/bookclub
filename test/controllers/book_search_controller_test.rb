require "test_helper"

class BookSearchControllerTest < ActionDispatch::IntegrationTest
  def sign_in
    #Authenticate
    club = Club.create!(name: "club")
    member = Member.create!(club: club)
    User.create!(username: "me", password: "password", member: member)

    result = post(
      sessions_path, 
      params: { username: "me", password: "password" }, 
      headers: { "Authorization": ActionController::HttpAuthentication::Basic. encode_credentials('me', 'password') }
    )
  end

  test "GET index" do
    sign_in
    get book_search_index_path, xhr: true

    assert_response(:success)
  end
end