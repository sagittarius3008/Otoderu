class CreateBelongings < ActiveRecord::Migration[5.2]
  def change
    create_table :belongings do |t|

      t.timestamps
      
      t.integer :orchesta_id, null: false
      t.integer :member_id, null: false
      t.boolean :part_top, null: false, default: false
      t.integer :belonging_status, null: false, default: 0
    end
  end
end
