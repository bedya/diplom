class CreateComents < ActiveRecord::Migration
  
  def change

    create_table :coments do |t|
      t.text :body
      t.integer :user_id
      t.integer :commentable_id #idcoment/віртуальна модель кожного комента
      t.string  :commentable_type #id назви моделі комента
      t.timestamps
    end
  end
end
