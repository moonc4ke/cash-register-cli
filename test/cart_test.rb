require "minitest/autorun"
require_relative "../lib/product"
require_relative "../lib/cart"
require_relative "../lib/discount"

class CartTest < Minitest::Test
  def setup
    @green_tea = Product.new(code: "GR1", name: "Green Tea", price: 3.11)
    @strawberries = Product.new(code: "SR1", name: "Strawberries", price: 5.00)
    @coffee = Product.new(code: "CF1", name: "Coffee", price: 11.23)
    @cart = Cart.new
  end

  def test_should_add_products_to_the_cart
    @cart.add(@green_tea)
    @cart.add(@strawberries)
    assert_equal 2, @cart.items.count
    assert_includes @cart.items, @green_tea
    assert_includes @cart.items, @strawberries
  end

  def test_should_calculate_total_price_without_discounts
    @cart.add(@green_tea)
    @cart.add(@strawberries)
    expected_total = @green_tea.price + @strawberries.price
    assert_equal expected_total, @cart.total
  end

  def test_should_apply_bogo_green_tea_discount_correctly
    2.times { @cart.add(@green_tea) }
    expected_total = @green_tea.price
    assert_equal expected_total, @cart.total
  end

  def test_should_apply_bulk_strawberries_discount_correctly
    3.times { @cart.add(@strawberries) }
    expected_total = 4.50 * 3
    assert_equal expected_total, @cart.total
  end

  def test_should_apply_coffee_discount_correctly_for_3_or_more
    3.times { @cart.add(@coffee) }
    discounted_price_per_coffee = @coffee.price * (2.0 / 3.0)
    expected_total = discounted_price_per_coffee * 3
    assert_in_delta expected_total, @cart.total, 0.01
  end
end
