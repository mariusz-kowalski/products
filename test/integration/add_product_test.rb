require 'test_helper'

class AddProductTest < ActiveSupport::TestCase
  def test_adding_product
    result = AddProduct.call(
      product_attributes: { name: 'The Watch',
                            external_id: 123,
                            manufacturer_code: '111',
                            ean: '222',
                            price: '505' },
      category_branch: %w[Watches Mens],
      manufacturer_name: 'Super Watch'
    )

    assert result.success?
  end
end
