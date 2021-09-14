class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :orchestra_id, null: false
      t.integer :member_id, null: false
      t.text :body, null: false
      t.decimal :score, precision: 5, scale: 3
      t.timestamps
    end
  end
end
