require "test_helper"

class ListCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: "Sports")
    @category_2 = Category.create(name: "Programming")
  end

  test "should show categories listing" do
    get categories_path
    assert_select "a", { href: category_path(@category), 'aria-label': @category.name }
    assert_select "a", { href: category_path(@category_2), 'aria-label': @category_2.name }
  end
end
