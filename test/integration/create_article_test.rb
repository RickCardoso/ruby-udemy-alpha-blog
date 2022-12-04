require "test_helper"

class CreateArticleTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(username: "author", email: "author@rails.com", password: "password")
    sign_in_as(@user, "password")
  end

  test "get new article form and create article" do
    get "/articles/new"
    assert_response :success
    assert_difference "Article.count", 1 do
      post articles_path, params: { article: { title: "This is a test article", description: "This is a test description" } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "This is a test article", response.body
  end
end
