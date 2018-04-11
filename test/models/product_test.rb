require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def test_external_id_uniqueness
    product = Product.new external_id: 1
    product.valid?
    assert_includes product.errors[:external_id], 'has already been taken'
  end

  def test_presence_of_category
    product = Product.new
    product.valid?
    assert_includes product.errors[:category], 'must exist'
  end

  def test_presence_of_manufacturer
    product = Product.new
    product.valid?
    assert_includes product.errors[:manufacturer], 'must exist'
  end

  def test_presence_of_price
    product = Product.new
    product.valid?
    assert_includes product.errors[:price], "can't be blank"
  end

  def test_price_greater_then_zero
    product = Product.new price: -1
    product.valid?
    assert_includes product.errors[:price], 'must be greater than 0'
  end

  def test_name_longer_than_2
    product = Product.new name: 'aa'
    product.valid?
    assert_includes product.errors[:name],
                    'is too short (minimum is 3 characters)'
  end

  def test_name_shorter_than_101
    product = Product.new(name: 'a' * 101)
    product.valid?
    assert_includes product.errors[:name],
                    'is too long (maximum is 100 characters)'
  end

  def test_manufacturer_code_longer_than_2
    product = Product.new manufacturer_code: 'aa'
    product.valid?
    assert_includes product.errors[:manufacturer_code],
                    'is too short (minimum is 3 characters)'
  end

  def test_manufacturer_code_shorter_than_101
    product = Product.new(manufacturer_code: 'a' * 101)
    product.valid?
    assert_includes product.errors[:manufacturer_code],
                    'is too long (maximum is 100 characters)'
  end

  def test_ean_longer_than_2
    product = Product.new ean: 'aa'
    product.valid?
    assert_includes product.errors[:ean],
                    'is too short (minimum is 3 characters)'
  end

  def test_ean_shorter_than_101
    product = Product.new(ean: 'a' * 101)
    product.valid?
    assert_includes product.errors[:ean],
                    'is too long (maximum is 100 characters)'
  end
end
