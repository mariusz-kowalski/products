require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  def test_index
    get root_url
    assert_response :success
  end
end
