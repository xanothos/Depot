class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def total_price
    line_items.to_a.sum do |item|
      item.product_price
    end
  end

  def add_product(product_id)
    current_item = line_items.find_by(product_id: product_id)
    if (current_item)
      current_item.quantity += 1
      logger.debug "Price: #{current_item.product_price}, Item Price: #{current_item.product_price}"
      current_item.product_price += current_item.product.price
    else
      current_item = line_items.build(product_id: product_id, product_price: Product.find(product_id).price)
    end
    current_item
  end
end
