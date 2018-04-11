require 'test_helper'

class ManufacturerTest < ActiveSupport::TestCase
  def test_name_uniqueness
    manufacturer = Manufacturer.new name: 'Cool Watch'
    manufacturer.valid?
    assert_includes manufacturer.errors[:name], "has already been taken"
  end

  def test_name_longer_than_2
    manufacturer = Manufacturer.new name: 'aa'
    manufacturer.valid?
    assert_includes manufacturer.errors[:name],
                    'is too short (minimum is 3 characters)'
  end

  def test_name_shorter_than_101
    manufacturer = Manufacturer.new(name: 'a' * 101)
    manufacturer.valid?
    assert_includes manufacturer.errors[:name],
                    'is too long (maximum is 100 characters)'
  end
end
