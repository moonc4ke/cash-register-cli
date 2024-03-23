require "minitest/autorun"
require_relative "../lib/product"

class ProductTest < MiniTest::Test
  def test_product_attributes
    product = Product.new(code: "GR1", name: "Green Tea", price: 3.11)
    assert_equal "GR1", product.code
    assert_equal "Green Tea", product.name
    assert_equal 3.11, product.price
  end
end
