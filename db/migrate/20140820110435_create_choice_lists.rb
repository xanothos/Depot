class CreateChoiceLists < ActiveRecord::Migration
  def change
    create_table :choice_lists do |t|
      t.string :list_name
      t.string :display_text
      t.string :value
      t.integer :order

      t.timestamps

    end
  end
end
