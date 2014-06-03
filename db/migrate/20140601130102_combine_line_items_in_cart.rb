class CombineLineItemsInCart < ActiveRecord::Migration
  def up
    Cart.all.each do |cart|
      sums = cart.line_items.group(:product_id).sum(:quantity)
      sums.each do |product_id, quantity|
        next if quantity == 1 ## skip if quantity is only 1

        cart.line_items.where(product_id: product_id).delete_all
        item = cart.line_items.build(product_id: product_id, quantity: quantity)
        item.save!
      end
    end
  end
end
