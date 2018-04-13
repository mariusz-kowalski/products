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

  def test_name_longer_than_2
    category = Category.new name: 'aa'
    category.valid?
    assert_includes category.errors[:name],
                    'is too short (minimum is 3 characters)'
  end

  def test_name_shorter_than_101
    category = Category.new(name: 'a' * 101)
    category.valid?
    assert_includes category.errors[:name],
                    'is too long (maximum is 100 characters)'
  end

  def test_find_or_create_with_parents
    category = Category.find_or_create_with_parents!(%w[Watches Womens])
    assert category
    assert_equal categories(:watches), category.parent
  end
end
