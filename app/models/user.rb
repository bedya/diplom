class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

#validates :login, presence: true

	has_one  :cart  #user has one cart
	has_many :orders #user has_many orders
	has_many :coments

	#Колбеки
   after_initialize { puts "initialized" } #виконується після Item.new; Item.last
   after_save       { puts "saved" }       #Item.save; Item.create; item.update_attributes()
   after_create     { puts "created" }
   after_update     { puts "updated" }
   after_destroy    { puts "destroyed" }

end
