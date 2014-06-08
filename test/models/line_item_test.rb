require 'test_helper'

class LineItemTest < ActiveSupport::TestCase
  fixtures (:products)

  test "creating a line item and setting the cart" do
    @cart = Cart.new
    @line_item = @cart.line_items.build(product: products(:ruby))

    assert_equal @line_item.cart, @cart
    assert_same  @line_item.cart, @cart
  end
end
