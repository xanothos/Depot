class AddProductPriceToLineItems < ActiveRecord::Migration
  def up
    add_column :line_items, :product_price, :decimal, default: 0
    ## now copy the current price into the line item
    LineItem.where('product_id is not null').each do |line_item|
      line_item.product_price = line_item.product.price * line_item.quantity
      line_item.save!
    end
  end

  def down
    remove_column :line_items, :product_price
    ## nothing additional to do here with price - it's been removed
  end
end
