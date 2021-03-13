class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories, id: false do |t|

      t.column :id, 'BIGINT PRIMARY KEY AUTO_INCREMENT'
      t.string :name, null: false, unique: true
      t.timestamps

    end
  end
end
