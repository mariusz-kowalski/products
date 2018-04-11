require 'test_helper'

class ManufacturerTest < ActiveSupport::TestCase
  def test_name_uniqueness
    manufacturer = Manufacturer.new name: 'Cool Watch'
    manufacturer.valid?
    assert_includes manufacturer.errors[:name], "has already been taken"
  end
end
