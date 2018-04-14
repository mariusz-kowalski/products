require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  def test_index
    get products_index_url
    assert_response :success
  end
end
