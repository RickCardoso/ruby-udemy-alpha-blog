require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(name: "Sports")
  end 

  test "category should be valid" do
    assert(@category.valid?)
  end

  test "name should be present" do
    @category.name = " "
    assert(@category.invalid?)
  end

  test "name should be unique" do
    @category.save
    @category2 = Category.new(name: "Sports")
    assert(@category2.invalid?)
  end

  test "name uniqueness should be case insensitive" do
    @category.save
    @category2 = Category.new(name: "sports")
    assert(@category2.invalid?)
  end

  test "name should not be too long" do
    @category.name = "a" * 26
    assert(@category.invalid?)
  end

  test "name should not be too short" do
    @category.name = "aa"
    assert(@category.invalid?)
  end
end