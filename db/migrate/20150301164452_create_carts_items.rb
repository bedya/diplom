class CreateCartsItems < ActiveRecord::Migration

  def change
    create_table :carts_items do |t| #связуюча таблиця
    #таблиця має називатись іменами 2-х моделей які ми звязуєм
    	t.integer :cart_id
    	t.integer :item_id
    end
  end
end
