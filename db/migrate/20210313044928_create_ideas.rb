class CreateIdeas < ActiveRecord::Migration[5.2]
  def change
    create_table :ideas, id: false do |t|
      t.column :id, 'BIGINT PRIMARY KEY AUTO_INCREMENT'
      t.bigint :category_id, null: false
      t.text :body, null: false
      t.timestamps
    end
  end
end
