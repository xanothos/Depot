class ChangePaymentType < ActiveRecord::Migration
  def up
    remove_column :orders, :pay_type
    add_column :orders, :pay_type, :integer
  end

  def down
    remove_column :orders, :pay_type
    add_column :orders, :pay_type, :string
  end
end
