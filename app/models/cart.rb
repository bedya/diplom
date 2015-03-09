class Cart < ActiveRecord::Base

	belongs_to  :user
	has_many    :positions
	has_many    :items, through: :positions
	#створюєм міграцію

	#Колбеки
   after_initialize { puts "initialized" } #виконується після Item.new; Item.last
   after_save       { puts "saved" }       #Item.save; Item.create; item.update_attributes()
   after_create     { puts "created" }
   after_update     { puts "updated" }
   after_destroy    { puts "destroyed" }

end
