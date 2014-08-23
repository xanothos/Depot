class Order < ActiveRecord::Base
  has_one :choice_list, foreign_key: :payment_type
  has_many :line_items, dependent: :destroy
  validates :name, :address, :email, presence: true
  #validates :pay_type, inclusion: ChoiceList.select(:value).where(list_name: :payment_type).map{|x| x.value}
  validates_presence_of :pay_type

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
