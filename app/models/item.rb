class Item < ActiveRecord::Base

  validates :price, numericality: { greater_than: 0, allow_nil: true }
  validates :name, :description, presence: true #якщо пусті то false

   #Колбеки
   after_initialize { puts "initialized" } #виконується після Item.new; Item.last
   after_save       { puts "saved" }       #Item.save; Item.create; item.update_attributes()
   after_create     { puts "created" }
   after_update     { puts "updated" }
   after_destroy    { puts "destroyed" }
   
    has_many :positions
    has_many :carts, through: :positions
    has_many :coments, as: :commentable #робить модель коментованою
end
