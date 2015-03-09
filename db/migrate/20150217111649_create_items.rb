class CreateItems < ActiveRecord::Migration
  def change
    	create_table :items do |t|#створюєм таблицю items
        t.float   :price #стовбці таблиці
        t.string  :name
        t.boolean :real
        t.float   :weight 
        t.string  :description
        t.timestamps #добавляє 2 стовпці 
                   #:created_at, :updated_at
                   #при збережені буде обновляти,
                   #а якшо нова то створюват
    end
    add_index :items, :price #для пошуку по БД
    add_index :items, :name
  end
end
