require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def test_name_presence_validation
    category = Category.new
    category.valid?
    assert_includes category.errors[:name], "can't be blank"
  end

  def test_name_uniqueness_within_same_parent_category
    category = Category.new name: 'Watches'
    category.valid?
    assert_includes category.errors[:name], "has already been taken"
  end

  def test_ability_to_create_root_category
    category = Category.new(name: 'Shoes')
    assert category.valid?
  end
end
