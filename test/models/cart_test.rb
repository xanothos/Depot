require 'test_helper'

class CartTest < ActiveSupport::TestCase
  fixtures (:products)

  test "adding a duplicate item increases quantity" do
    cart = Cart.new
    cart.add_product(products(:ruby).id).save!
    cart.add_product(products(:ruby).id).save!

    assert_equal 1, cart.line_items.size
    assert_equal 2, cart.line_items.first.quantity
  end

  test "adding unique product causes line item count to increase" do
    cart = Cart.new
    cart.add_product(products(:ruby).id).save!
    cart.add_product(products(:one).id).save!

    assert_equal 2, cart.line_items.size
    cart.line_items.each do |item|
      assert_equal 1, item.quantity
    end
  end
end
